#!/bin/bash
set -euo pipefail

# Run from any directory. ANDROID_BUILD_TOP may select another source checkout.
PATCH_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
SOURCE_ROOT=${ANDROID_BUILD_TOP:-$(dirname -- "$PATCH_DIR")}
CHECK_ONLY=false
if [[ ${1:-} == --check ]]; then
    CHECK_ONLY=true
    shift
fi
if (( $# )); then
    echo "Usage: $0 [--check]" >&2
    exit 2
fi

(cd -- "$PATCH_DIR" && sha256sum --check --status SHA256SUMS)

declare -a pending=()
index_file=
trap 'if [[ -n "$index_file" ]]; then rm -f -- "$index_file"; fi' EXIT

# Validate every project before changing any source checkout.
while IFS=$'\t' read -r project base_commit base_tree target_tree count; do
    [[ -z "$project" || "$project" == \#* ]] && continue
    repo="$SOURCE_ROOT/$project"
    if [[ ! -d "$repo" ]] || ! git -C "$repo" rev-parse --git-dir >/dev/null 2>&1; then
        echo "Missing Git project: $repo" >&2
        exit 1
    fi
    if [[ -n $(git -C "$repo" status --porcelain --untracked-files=no) ]]; then
        echo "Commit or save tracked changes before applying patches: $project" >&2
        exit 1
    fi
    current_tree=$(git -C "$repo" rev-parse 'HEAD^{tree}')
    if [[ "$current_tree" == "$target_tree" ]]; then
        echo "Already matches patched source: $project"
        continue
    fi
    if [[ "$current_tree" != "$base_tree" ]]; then
        echo "Unexpected source tree: $project" >&2
        echo "Expected upstream $base_commit or the recorded patched tree." >&2
        echo "Inspect local changes or use the pinned revisions in patches.json." >&2
        exit 1
    fi
    mapfile -t patches < <(find "$PATCH_DIR/$project" -maxdepth 1 -type f -name '0*.patch' | LC_ALL=C sort)
    if (( ${#patches[@]} != count )); then
        echo "Patch count mismatch: $project" >&2
        exit 1
    fi
    index_file=$(mktemp)
    rm -f -- "$index_file"
    GIT_INDEX_FILE="$index_file" git -C "$repo" read-tree HEAD
    for patch in "${patches[@]}"; do
        GIT_INDEX_FILE="$index_file" git -C "$repo" apply --cached --binary --whitespace=nowarn "$patch"
    done
    replay_tree=$(GIT_INDEX_FILE="$index_file" git -C "$repo" write-tree)
    rm -f -- "$index_file"
    index_file=
    if [[ "$replay_tree" != "$target_tree" ]]; then
        echo "Patch replay differs from recorded source: $project" >&2
        exit 1
    fi
    echo "Validated $count patches: $project"
    pending+=("$project")
done < "$PATCH_DIR/series.tsv"

if "$CHECK_ONLY"; then
    echo "Validation complete; source checkouts unchanged."
    exit 0
fi

for project in "${pending[@]}"; do
    repo="$SOURCE_ROOT/$project"
    mapfile -t patches < <(find "$PATCH_DIR/$project" -maxdepth 1 -type f -name '0*.patch' | LC_ALL=C sort)
    echo "Applying ${#patches[@]} patches: $project"
    git -C "$repo" am --keep-cr --no-gpg-sign "${patches[@]}"
    target_tree=$(awk -F '\t' -v project="$project" '$1 == project { print $4 }' "$PATCH_DIR/series.tsv")
    [[ $(git -C "$repo" rev-parse 'HEAD^{tree}') == "$target_tree" ]]
done
echo "Done."

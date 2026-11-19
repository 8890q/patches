# Legacy NFC polling and controller recovery

Android 17 configures ordinary tag polling while the screen is off and relies
on NCI 2.0 screen-state commands to gate it. NCI 1.x controllers cannot use
those commands. This patch restores discovery-based gating for NCI 1.x and
serializes the routing update with the screen-state message.

Ordinary polling stops on screen off and while locked. Explicit lockscreen
unlock/provisioning polling and host card-emulation routing are retained.
The NCI 2.x discovery policy is unchanged.

The herolte baseline lost 87-88% charge over approximately 15h25 with only
26 seconds of screen-on time. CPU awake time was approximately 78%; sec-nfc
accounted for about 26,700 wakeups and its wake lock was held for 9h54.
NFC reported NCI 1.0, screen OFF_LOCKED, and the default polling mask.

Validation: the unmodified production discovery method reproduces the
screen-off polling regression. The corrected method and the production
NfcDiscoveryParameters class pass 393 host assertions covering NCI 1.x/2.x,
screen states, reader mode, HCE, provisioning and lockscreen opt-in.
Patch replay matches the committed source tree. Android unit regressions
are included; their execution and an unplugged deep-sleep test await the
next ROM build. USB prevents a meaningful on-cable suspend measurement.

The November 19 follow-up log detects and connects to an ISO-DEP/NFC-A card,
then times out stopping discovery when the delayed polling restart fires.
Recovery wakes that wait, but the original caller immediately queues polling
again and waits forever with the NfcService monitor held. Recovery cannot get
that monitor; later card reads and screen-state routing stop responding.

Patch 0002 stops the transaction after an aborted RF-stop or polling command,
bounds the polling/configuration waits, and rechecks controller state after
lock acquisition and completion. Recovery callbacks run after releasing the
native locks. Discovery reconfiguration also returns if a polling step fails.
The screen-off polling policy remains in patch 0001.

Run `python3 packages/modules/Nfc/tests/check_polling_recovery.py
/path/to/lineage/packages/modules/Nfc` from this patches checkout. It compiles
the actual production JNI functions with fake NFA events and runs 318 host
assertions: normal polling, the captured timeout sequence, missing responses,
command failures, shutdown/recovery races, lock release and NCI 2.x config.
The previous source fails the captured sequence by sending a command after
recovery started. These checks cannot establish live tag-reading or suspend
behavior; those still require the next device test.

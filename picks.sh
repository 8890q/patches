#!/bin/bash

# Abort early on error
set -eE

## Project: LineageOS/android_frameworks_base

./vendor/lineage/build/tools/repopick.py 320714 # SystemUI: add burnIn protection
./vendor/lineage/build/tools/repopick.py 320765 # SystemUI: Fix shutter sound
./vendor/lineage/build/tools/repopick.py 321337 # Deprioritize important developer notifications
./vendor/lineage/build/tools/repopick.py 321338 # Allow disabling important developer notifications
./vendor/lineage/build/tools/repopick.py 321339 # Allow disabling USB notifications
./vendor/lineage/build/tools/repopick.py 322825 # Add CHANNEL_MODE_DUAL_CHANNEL constant
./vendor/lineage/build/tools/repopick.py 322826 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
./vendor/lineage/build/tools/repopick.py 322827 # Allow SBC as HD audio codec in Bluetooth device configuration
./vendor/lineage/build/tools/repopick.py 322828 # Explicitly make SBC Dual Channel an optional (HD) codec
./vendor/lineage/build/tools/repopick.py 326692 # Skip screen on animation when wake and unlock via biometrics
./vendor/lineage/build/tools/repopick.py 327687 # biometrics: Allow to disable haptic feedback on success authentication

## Project: LineageOS/android_lineage-sdk

./vendor/lineage/build/tools/repopick.py 327684 # lineage: res: Introduce config to disable biometrics success haptic feedback
./vendor/lineage/build/tools/repopick.py 327685 # lineage-sdk: Add preference keys for biometrics success haptic feedback

## Project: LineageOS/android_packages_apps_Bluetooth

./vendor/lineage/build/tools/repopick.py 322838 # SBC Dual Channel (SBC HD Audio) support

## Project: LineageOS/android_packages_apps_Camera2

./vendor/lineage/build/tools/repopick.py 328557 # Camera2: remove duplicate getDisplayRotation()
./vendor/lineage/build/tools/repopick.py 330701 # Camera2: import quickReader module from Snap
./vendor/lineage/build/tools/repopick.py 330702 # Camera2: add QR code launcher shortcut

## Project: LineageOS/android_packages_apps_CarrierConfig

./vendor/lineage/build/tools/repopick.py 320749 # Fix voicemail for Bouygues Telecom France

## Project: LineageOS/android_packages_apps_Gallery2

./vendor/lineage/build/tools/repopick.py 328558 # Gallery2: improve scroll position when re-entering TimeLineSlotView

## Project: LineageOS/android_packages_apps_LineageParts

./vendor/lineage/build/tools/repopick.py 326739 # Trust: Add option to always disable USB gadgets

## Project: LineageOS/android_packages_apps_Messaging

./vendor/lineage/build/tools/repopick.py 324405 # Add support for text/vCard and text/vCalendar MIME type

## Project: LineageOS/android_packages_apps_Settings

./vendor/lineage/build/tools/repopick.py 322833 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
./vendor/lineage/build/tools/repopick.py 327686 # Settings: Add biometrics success haptic feedback preference

## Project: LineageOS/android_packages_apps_Trebuchet

./vendor/lineage/build/tools/repopick.py 317967 # Enable crossfade when changing theme
./vendor/lineage/build/tools/repopick.py 317969 # Expose themed icon setting in ThemePicker
./vendor/lineage/build/tools/repopick.py 326714 # NavbarButtonsViewController: Support navbar layout inversion
./vendor/lineage/build/tools/repopick.py 329276 # Trebuchet: Refresh app icons on colors changed

## Project: LineageOS/android_packages_modules_Permission

./vendor/lineage/build/tools/repopick.py 317973 # PermissionController: Show up to 7 days of permission usage history

## Project: LineageOS/android_packages_modules_adb

./vendor/lineage/build/tools/repopick.py 326385 # adb: Bring back support for legacy FunctionFS

## Project: LineageOS/android_system_bt

./vendor/lineage/build/tools/repopick.py 322834 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
./vendor/lineage/build/tools/repopick.py 322835 # Explicit SBC Dual Channel (SBC HD) support
./vendor/lineage/build/tools/repopick.py 322836 # Allow using alternative (higher) SBC HD bitrates with a property

## Project: LineageOS/android_system_core

./vendor/lineage/build/tools/repopick.py 317912 # init: Don't run update_sys_usb_config if /data isn't mounted

## Project: LineageOS/android_vendor_lineage

./vendor/lineage/build/tools/repopick.py 317982 # device_config: Keep up to 7 days of permission usage history
./vendor/lineage/build/tools/repopick.py 328958 # apns: add We

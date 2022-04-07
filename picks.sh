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

## Project: LineageOS/android_packages_apps_Bluetooth

./vendor/lineage/build/tools/repopick.py 322838 # SBC Dual Channel (SBC HD Audio) support

## Project: LineageOS/android_packages_apps_CarrierConfig

./vendor/lineage/build/tools/repopick.py 320749 # Fix voicemail for Bouygues Telecom France

## Project: LineageOS/android_packages_apps_DeskClock

./vendor/lineage/build/tools/repopick.py 324512 # DeskClock: Remove unused drawables
./vendor/lineage/build/tools/repopick.py 325330 # DeskClock: Add FLAG_IMMUTABLE
./vendor/lineage/build/tools/repopick.py 325331 # DeskClock: Make sure int values are unique
./vendor/lineage/build/tools/repopick.py 325332 # DeskClock: Material Me? No YOU!
./vendor/lineage/build/tools/repopick.py 325367 # DeskClock: Add gradle
./vendor/lineage/build/tools/repopick.py 325953 # DeskClock: Fix left button display
./vendor/lineage/build/tools/repopick.py 326383 # DeskClock: Remove legacy support
./vendor/lineage/build/tools/repopick.py 326994 # DeskClock: Remove compatibility to old APIs

## Project: LineageOS/android_packages_apps_LineageParts

./vendor/lineage/build/tools/repopick.py 326739 # Trust: Add option to always disable USB gadgets
./vendor/lineage/build/tools/repopick.py 326877 # LineageParts: switch to 3-button navigation when disabling navbar

## Project: LineageOS/android_packages_apps_Messaging

./vendor/lineage/build/tools/repopick.py 324405 # Add support for text/vCard and text/vCalendar MIME type

## Project: LineageOS/android_packages_apps_Settings

./vendor/lineage/build/tools/repopick.py 322833 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu

## Project: LineageOS/android_packages_apps_SetupWizard

./vendor/lineage/build/tools/repopick.py 323145 # SUW: Enable status bar outside of FinishActivity

## Project: LineageOS/android_packages_apps_Trebuchet

./vendor/lineage/build/tools/repopick.py 317967 # Enable crossfade when changing theme
./vendor/lineage/build/tools/repopick.py 317969 # Expose themed icon setting in ThemePicker
./vendor/lineage/build/tools/repopick.py 326714 # NavbarButtonsViewController: Support navbar layout inversion

## Project: LineageOS/android_packages_inputmethods_LatinIME

./vendor/lineage/build/tools/repopick.py 325405 # LatinIME: fit more emoji in a page
./vendor/lineage/build/tools/repopick.py 325748 # LatinIME: add attr for vertical hint padding
./vendor/lineage/build/tools/repopick.py 325406 # LatinIME: Initial You
./vendor/lineage/build/tools/repopick.py 325437 # LatinIME: remove unused drawables
./vendor/lineage/build/tools/repopick.py 325438 # LatinIME: show emoji key when language switch key is not showing
./vendor/lineage/build/tools/repopick.py 328160 # LatinIME: update follow system theme label

## Project: LineageOS/android_packages_modules_Permission

./vendor/lineage/build/tools/repopick.py 317972 # PermissionController: Enable usage timeline for all permission groups
./vendor/lineage/build/tools/repopick.py 317973 # PermissionController: Show up to 7 days of permission usage history

## Project: LineageOS/android_packages_modules_adb

./vendor/lineage/build/tools/repopick.py 326385 # adb: Bring back support for legacy FunctionFS

## Project: LineageOS/android_packages_overlays_Lineage

./vendor/lineage/build/tools/repopick.py 326989 # NavigationBarNoHint: Set taskbar_frame_height to 0dp

## Project: LineageOS/android_packages_services_Telecomm

./vendor/lineage/build/tools/repopick.py 327458 # Telecomm: Squashed phone_type switch support

## Project: LineageOS/android_system_bt

./vendor/lineage/build/tools/repopick.py 319781 # Add option to change eSCO Transport Unit Size to 16
./vendor/lineage/build/tools/repopick.py 322834 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
./vendor/lineage/build/tools/repopick.py 322835 # Explicit SBC Dual Channel (SBC HD) support
./vendor/lineage/build/tools/repopick.py 322836 # Allow using alternative (higher) SBC HD bitrates with a property

## Project: LineageOS/android_system_core

./vendor/lineage/build/tools/repopick.py 317912 # init: Don't run update_sys_usb_config if /data isn't mounted

## Project: LineageOS/android_vendor_lineage

./vendor/lineage/build/tools/repopick.py 317981 # device_config: Save discrete app op history for more permissions
./vendor/lineage/build/tools/repopick.py 317982 # device_config: Keep up to 7 days of permission usage history
./vendor/lineage/build/tools/repopick.py 325012 # lineage: Opt-in to shipping full recovery image by default
./vendor/lineage/build/tools/repopick.py 326712 # overlay: show all icons in collapsed statusbar
./vendor/lineage/build/tools/repopick.py 327902 # overlays: Use rounded corners in SystemUI
./vendor/lineage/build/tools/repopick.py 328170 # config: Disable remote keyguard animation until it's fixed

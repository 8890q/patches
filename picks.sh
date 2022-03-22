#!/bin/bash

# Abort early on error
set -eE

## Project: LineageOS/android_external_setupcompat

./vendor/lineage/build/tools/repopick.py 326705 # Add option to look at main app for Partner resources
./vendor/lineage/build/tools/repopick.py 326706 # Enable DayNight and dynamic colors by default
./vendor/lineage/build/tools/repopick.py 326707 # Import pixel setupwizard overlay resources

## Project: LineageOS/android_frameworks_av

./vendor/lineage/build/tools/repopick.py 320337 # Request to reset effect buffer in clearInputBuffer
./vendor/lineage/build/tools/repopick.py 322937 # cameraserver: fix deadlock scenario in torchModeStatusChanged callback.

## Project: LineageOS/android_frameworks_base

./vendor/lineage/build/tools/repopick.py 318763 # SystemUI: runtime configurable audio panel location
./vendor/lineage/build/tools/repopick.py 320714 # SystemUI: add burnIn protection
./vendor/lineage/build/tools/repopick.py 320765 # SystemUI: Fix shutter sound
./vendor/lineage/build/tools/repopick.py 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
./vendor/lineage/build/tools/repopick.py 321337 # Deprioritize important developer notifications
./vendor/lineage/build/tools/repopick.py 321338 # Allow disabling important developer notifications
./vendor/lineage/build/tools/repopick.py 321339 # Allow disabling USB notifications
./vendor/lineage/build/tools/repopick.py 326692 # Skip screen on animation when wake and unlock via biometrics
./vendor/lineage/build/tools/repopick.py 326735 # Revert "base: add Trust usb restrictor"
./vendor/lineage/build/tools/repopick.py 326736 # Rewrite trust USB restriction handling
./vendor/lineage/build/tools/repopick.py 322825 # Add CHANNEL_MODE_DUAL_CHANNEL constant
./vendor/lineage/build/tools/repopick.py 322826 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
./vendor/lineage/build/tools/repopick.py 322827 # Allow SBC as HD audio codec in Bluetooth device configuration
./vendor/lineage/build/tools/repopick.py 322828 # Explicitly make SBC Dual Channel an optional (HD) codec

## Project: LineageOS/android_lineage-sdk

./vendor/lineage/build/tools/repopick.py 325903 # lineage-sdk: Remove NativeHelper class
./vendor/lineage/build/tools/repopick.py 326734 # Log failure to update DATABASE_VERSION
./vendor/lineage/build/tools/repopick.py 326737 # Move trust usb setting to global, and drop keyguard from name
./vendor/lineage/build/tools/repopick.py 326740 # Create LineageGlobalSettingListPreference
./vendor/lineage/build/tools/repopick.py 326980 # Fix Usb Restrictor if USB HAL 1.3+ is not present

## Project: LineageOS/android_packages_apps_Bluetooth

./vendor/lineage/build/tools/repopick.py 322838 # 322838: SBC Dual Channel (SBC HD Audio) support

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

## Project: LineageOS/android_packages_apps_Dialer

./vendor/lineage/build/tools/repopick.py 324509 # Dialer: remove unused drawables
./vendor/lineage/build/tools/repopick.py 324510 # Dialer: Material You

## Project: LineageOS/android_packages_apps_Eleven

./vendor/lineage/build/tools/repopick.py 327078 # Move loader init after view setup

## Project: LineageOS/android_packages_apps_LineageParts

./vendor/lineage/build/tools/repopick.py 326739 # Trust: Add option to always disable USB gadgets
./vendor/lineage/build/tools/repopick.py 326877 # LineageParts: switch to 3-button navigation when disabling navbar

## Project: LineageOS/android_packages_apps_Messaging

./vendor/lineage/build/tools/repopick.py 324404 # Messaging: use Material You colors
./vendor/lineage/build/tools/repopick.py 324504 # Messaging: remove unused drawables
./vendor/lineage/build/tools/repopick.py 324505 # Messaging: Update checkmark PNG drawable with XML drawable

## Project: LineageOS/android_packages_apps_Settings

./vendor/lineage/build/tools/repopick.py 325369 # Settings: Fix the failing strings
./vendor/lineage/build/tools/repopick.py 325897 # Settings: Support dark mode on 'Vision Settings'
./vendor/lineage/build/tools/repopick.py 325928 # Settings: Apply SUW button theming to WiFi page
./vendor/lineage/build/tools/repopick.py 327013 # Settings: Accessibility wants fullscreen, too!
./vendor/lineage/build/tools/repopick.py 327067 # Settings: Use display version for, well, displayed version
./vendor/lineage/build/tools/repopick.py 322833 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu

## Project: LineageOS/android_packages_apps_SetupWizard

./vendor/lineage/build/tools/repopick.py 323145 # SUW: Enable status bar outside of FinishActivity
./vendor/lineage/build/tools/repopick.py 325324 # SUW: Enable partner resources and switch to DayNight
./vendor/lineage/build/tools/repopick.py 325325 # SUW: Set button themes
./vendor/lineage/build/tools/repopick.py 325326 # SUW: Redesign Welcome page based on Pixel
./vendor/lineage/build/tools/repopick.py 326875 # SUW: add page for navigation mode

## Project: LineageOS/android_packages_apps_Trebuchet

./vendor/lineage/build/tools/repopick.py 317967 # Enable crossfade when changing theme
./vendor/lineage/build/tools/repopick.py 317969 # Expose themed icon setting in ThemePicker
./vendor/lineage/build/tools/repopick.py 326714 # NavbarButtonsViewController: Support navbar layout inversion
./vendor/lineage/build/tools/repopick.py 326988 # Trebuchet: Assume taskbar is disabled if its size is equal 0

## Project: LineageOS/android_packages_inputmethods_LatinIME

./vendor/lineage/build/tools/repopick.py 325405 # LatinIME: fit more emoji in a page
./vendor/lineage/build/tools/repopick.py 325406 # LatinIME: Initial You
./vendor/lineage/build/tools/repopick.py 325437 # LatinIME: remove unused drawables
./vendor/lineage/build/tools/repopick.py 325438 # LatinIME: show emoji key when language switch key is not shown
./vendor/lineage/build/tools/repopick.py 325748 # LatinIME: add attr for vertical hint padding

## Project: LineageOS/android_packages_modules_Permission

./vendor/lineage/build/tools/repopick.py 317972 # PermissionController: Enable usage timeline for all permission groups
./vendor/lineage/build/tools/repopick.py 317973 # PermissionController: Show up to 7 days of permission usage history

## Project: LineageOS/android_packages_modules_adb

./vendor/lineage/build/tools/repopick.py 326385 # adb: Bring back support for legacy FunctionFS

## Project: LineageOS/android_packages_overlays_Lineage

./vendor/lineage/build/tools/repopick.py 326989 # NavigationBarNoHint: Set taskbar_frame_height to 0dp

## Project: LineageOS/android_packages_services_Telephony

./vendor/lineage/build/tools/repopick.py 317558 # Telephony: Add ERI configuration for U.S. Cellular

## Project: LineageOS/android_system_bt

./vendor/lineage/build/tools/repopick.py 319781 # Add option to change eSCO Transport Unit Size to 16
./vendor/lineage/build/tools/repopick.py 322834 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
./vendor/lineage/build/tools/repopick.py 322835 # Explicit SBC Dual Channel (SBC HD) support
./vendor/lineage/build/tools/repopick.py 322836 # Allow using alternative (higher) SBC HD bitrates with a property

## Project: LineageOS/android_system_core

./vendor/lineage/build/tools/repopick.py 317912 # init: Don't run update_sys_usb_config if /data isn't mounted
./vendor/lineage/build/tools/repopick.py 325898 # fs_mgr: Don't run clean_scratch_files on non-dynamic devices

## Project: LineageOS/android_vendor_lineage

./vendor/lineage/build/tools/repopick.py 317981 # device_config: Save discrete app op history for more permissions
./vendor/lineage/build/tools/repopick.py 317982 # device_config: Keep up to 7 days of permission usage history
./vendor/lineage/build/tools/repopick.py 325012 # lineage: Opt-in to shipping full recovery image by default
./vendor/lineage/build/tools/repopick.py 326397 # roomservice: Support AOSP dependencies
./vendor/lineage/build/tools/repopick.py 326712 # overlay: show vibration icon in collapsed statusbar
./vendor/lineage/build/tools/repopick.py 326882 # build: tasks: kernel: Rework kernel fragments handling

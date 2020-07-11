import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kAppTitle = 'KDE Connect Sample';
const kAppVersionText = 'Version: ';
const kAppVersion = '1.0.0';

const kAppBarStatusIcon = Icon(Icons.brightness_3, size: 30);

// Send Files Tab
const kSendFilesIDText = 'Send Files';
const kSendFilesIcon = Icon(Icons.insert_drive_file);
const kFABPlusIcon = Icon(Icons.note_add, size: 43);

// Slideshow Remote Tab
const kSlideshowRemoteIDText = 'Slideshow Remote';
const kSlideshowInstructionText =
    'You can lock your device and use the volume keys to go to the previous/next slide';
const kSlideshowRemoteIcon = Icon(Icons.settings_remote);

// Media Control Tab
const kMediaControlIDText = 'Multimedia Control';
const kMediaControlTextStyle = TextStyle();
const kMediaControlIcon = Icon(Icons.play_circle_outline);

// Remote Input Tab
const kRemoteInputIDText = 'Remote Input';
const kRemoteInputIcon = Icon(FontAwesomeIcons.mousePointer);

const kFABKeyboardUpIcon = Icon(Icons.keyboard, size: 43);
const kFABKeyboardDownIcon = Icon(Icons.keyboard_hide, size: 43);
const kRemoteInputCenterText = 'Move finger on screen to move mouse cursor.';
const kRemoteInputCenter2Text = 'Tap to click.';
const kRemoteInputCenter3Text =
    'Use two/three fingers for right and middle buttons.';
const kRemoteInputCenter4Text = 'Use 2 fingers to scroll.';
const kRemoteInputCenter5Text = 'Use a long press to drag and drop';

// Run Command Tab
const kRunCommandIDText = 'Run Command';
const kRunCommandIcon = Icon(FontAwesomeIcons.terminal);
const kFABSearchIcon = Icon(Icons.search, size: 43);
const kCommandsLabelTextStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w500);

// Drawer
const kDrawerCategoryTextStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0);
const kCategoryDevicesText = 'Devices';
const kCategorySettingsText = 'Settings';
const kCategoryInformationText = 'Information';
const kDrawerItemsTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

// Drawer Item labels and Icons
const kConnectedDeviceText = 'laptop@kubuntu';
const kConnectedDeviceIcon = Icons.laptop;
const kConnectedDevice2Text = 'desktop@kubuntu';
const kConnectedDevice2Icon = Icons.desktop_windows;
const kConnectedDeviceSetting = FontAwesomeIcons.ellipsisV;
const kPairNewDeviceIcon = Icons.add_circle_outline;
const kPairNewDeviceText = 'Pair New Device';
const kSettingsIcon = Icons.settings;
const kSettingsText = 'Settings';
const kPluginSettingsIcon = Icons.tune;
const kPluginSettingsText = 'Plugin Settings';
const kEncryptionIcon = Icons.enhanced_encryption;
const kEncryptionInfoText = 'Encryption Info';
const kAboutIcon = Icons.info_outline;
const kAboutText = 'About App';
const kTrustedNetworksText = 'Trusted Networks';

// Device Name under Settings
const kSettingsDeviceNameText = 'Device Name';
const kSettingsDeviceNameTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500);
const kUserDeviceNameTextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);

// Encryption Info Popup Dialog
const kDeviceFingerprintText =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
const kThisDeviceFingerprintText =
    'SHA1 Fingerprint of Your Device Certificate:';
const kThisDeviceFingerprint =
    '00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00';
const kRemoteDeviceFingerprintText =
    'SHA1 Fingerprint of Remote Device Certificate:';
const kRemoteDeviceFingerprint =
    '00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00';
const kDoneText = 'Done';

// Pair New Device
const kPairNewDeviceHeadlineText =
    'Other devices running KDE Connect in your same network should appear here.';
const kPairNewDeviceHeadlineTextStyle = TextStyle(fontSize: 15);
const kConnectedDevicesText = 'Connected Devices';
const kConnectedDevicesTextStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const kBlockIcon = Icon(Icons.block, size: 35);

//  SimpleDialog
const kSimpleDialogItemTextStyle = TextStyle(fontSize: 20);
const kSimpleDialogConnectLabel = 'Connect';
const kSimpleDialogConnectIcon = Icon(Icons.phonelink, size: 60);
const kSimpleDialogDisconnectLabel = 'Disconnect';
const kSimpleDialogDisconnectIcon = Icon(Icons.phonelink_off, size: 60);
const kSimpleDialogAboutLabel = 'About Device';
const kSimpleDialogAboutIcon = Icon(Icons.info_outline, size: 60);

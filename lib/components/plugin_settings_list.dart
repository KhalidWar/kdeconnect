class PluginSetting {
  PluginSetting({
    this.isCheckboxChecked,
    this.title,
    this.subtitle,
    this.showIconButton,
    this.trailingIconFunction,
  });

  bool isCheckboxChecked;
  String title;
  String subtitle;
  bool showIconButton;
  Function trailingIconFunction;
}

List pluginSettingsList = [
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Filesystem Expose',
    subtitle: 'Allows to browse this device\'s filesystem remotely',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Media Player Control',
    subtitle: 'Control your phone\'s media players from another device',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Battery report',
    subtitle: 'Periodically report battery status',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Share and receive',
    subtitle: 'Share files and URLs between devices',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Notification sync',
    subtitle: 'Access your notification from other devices',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Telephony Notifier',
    subtitle: 'Access your notifications for incoming calls',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Launch Camera',
    subtitle: 'Launch the camera app to ease taking and transferring pictures',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Find Remote Device',
    subtitle: 'Ring your remote device',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Clipboard Sync',
    subtitle: 'Share the clipboard content',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Receive Notifications',
    subtitle:
        'Receive notifications from the other device and display them on Android',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Send SMS',
    subtitle: 'Send text messages from your desktop',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Ping',
    subtitle: 'Send and receive pings',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Find My Phone',
    subtitle: 'Rings this device so you can find it',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'System Volume',
    subtitle: 'Control the system volume of the remote device',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Slideshow Remote',
    subtitle: 'Use your device to change slides in a presentation',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Receive Remote Keypresses',
    subtitle: 'Receive keypress events from remote devices',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Multimedia Controls',
    subtitle: 'Provides a remote control for your media player',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Contacts Synchronizer',
    subtitle: 'Allow synchronizing the device\'s contacts book',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: false,
    title: 'Bigscreen Remote',
    subtitle: 'Use your device as a remote for Plasma bigscreen',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Remote Input',
    subtitle: 'Use your phone or tablet as a touchpad and keyboard',
    showIconButton: true,
    trailingIconFunction: () {},
  ),
  PluginSetting(
    isCheckboxChecked: true,
    title: 'Run Command',
    subtitle: 'Trigger remote commands from your phone or tablet',
    showIconButton: false,
    trailingIconFunction: () {},
  ),
];

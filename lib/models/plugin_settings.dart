class PluginSetting {
  const PluginSetting({
    this.isCheckboxChecked,
    this.title,
    this.subtitle,
    this.showIconButton,
    this.trailingIconFunction,
  });

  final bool isCheckboxChecked;
  final String title;
  final String subtitle;
  final bool showIconButton;
  final Function trailingIconFunction;
}

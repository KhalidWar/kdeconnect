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

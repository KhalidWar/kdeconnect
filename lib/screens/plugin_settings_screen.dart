import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/components/plugin_settings_list.dart';

class PluginSettingsScreen extends StatefulWidget {
  static const String id = 'plugin_settings_screen';

  @override
  _PluginSettingsScreenState createState() => _PluginSettingsScreenState();
}

class _PluginSettingsScreenState extends State<PluginSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plugin Settings')),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: pluginSettingsList.length,
          itemBuilder: (BuildContext context, int index) {
            IconButton trailingIconButton = IconButton(
                icon: Icon(Icons.tune),
                onPressed: () {
                  setState(() {
                    pluginSettingsList[index].trailingIconFunction();
                  });
                });

            return ListTile(
                leading: Checkbox(
                  activeColor: Theme.of(context).accentColor,
                  value: pluginSettingsList[index].isCheckboxChecked,
                  onChanged: (bool value) {
                    setState(() {
                      pluginSettingsList[index].isCheckboxChecked = value;
                    });
                  },
                ),
                title: Text(pluginSettingsList[index].title),
                subtitle: Text(pluginSettingsList[index].subtitle),
                trailing: pluginSettingsList[index].showIconButton
                    ? trailingIconButton
                    : null);
          },
        ),
      ),
    );
  }
}

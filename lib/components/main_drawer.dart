import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/components/about_app_dialog.dart';
import 'package:sample/components/connected_devices_list.dart';
import 'package:sample/components/device_simple_dialog.dart';
import 'package:sample/components/devices_list_tile.dart';
import 'package:sample/components/drawer_items_list_tile.dart';
import 'package:sample/constants.dart';
import 'package:sample/screens/pair_new_device_screen.dart';
import 'package:sample/screens/plugin_settings_screen.dart';
import 'package:sample/screens/settings_screen.dart';
import 'package:sample/services/theme_manager.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: <Widget>[
            // todo fix Header before shipping app
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('assets/icons/icon.png'),
                    ),
                  ),
                ],
              ),
            ),
            DrawerCategory(label: kCategoryDevicesText),
            CustomDivider(),
            // todo show connected device info like neofetch
            ListView.builder(
              shrinkWrap: true,
              itemCount: connectedDevicesList.length,
              itemBuilder: (context, index) {
                return DevicesListTile(
                  label: connectedDevicesList[index].label,
                  icon: connectedDevicesList[index].icon,
                  isConnected: connectedDevicesList[index].isConnected,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeviceSimpleDialog();
                      },
                    );
                  },
                );
              },
            ),

            DevicesListTile(
              label: kPairNewDeviceText,
              icon: kPairNewDeviceIcon,
              isConnected: false,
              onPressed: () {
                Navigator.pushNamed(context, PairNewDevice.id);
              },
            ),

            SizedBox(height: 10),
            DrawerCategory(label: kCategorySettingsText),
            CustomDivider(),
            DrawerItemsListTile(
              label: kSettingsText,
              icon: kSettingsIcon,
              isConnected: false,
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.id);
              },
            ),
            DrawerItemsListTile(
              label: kPluginSettingsText,
              icon: kPluginSettingsIcon,
              isConnected: false,
              onPressed: () {
                Navigator.pushNamed(context, PluginSettingsScreen.id);
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: <Widget>[
              Text(kAppTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(kAppVersionText),
                  Text(kAppVersion),
                ],
              ),
              AboutAppDialog(),
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerCategory extends StatelessWidget {
  const DrawerCategory({
    Key key,
    @required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: kDrawerCategoryTextStyle.copyWith(
          color: isLightTheme(context) ? Colors.black54 : Colors.white54,
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 25,
      height: 2,
      color: isLightTheme(context) ? Colors.black54 : Colors.white54,
    );
  }
}

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';
import 'package:kdeconnect/screens/pair_new_device_screen.dart';
import 'package:kdeconnect/screens/plugin_settings_screen.dart';
import 'package:kdeconnect/screens/settings_screen.dart';

import 'connected_devices_list.dart';
import 'device_simple_dialog.dart';
import 'devices_list_tile.dart';
import 'drawer_items_list_tile.dart';

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
            DrawerCategory(label: 'Devices'),
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
                    showModal(
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
              label: 'Pair New Device',
              icon: Icons.add_circle_outline,
              isConnected: false,
              onPressed: () {
                Navigator.pushNamed(context, PairNewDevice.id);
              },
            ),

            SizedBox(height: 10),
            DrawerCategory(label: 'Settings'),
            CustomDivider(),
            DrawerItemsListTile(
              label: 'Settings',
              icon: Icons.settings,
              isConnected: false,
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.id);
              },
            ),
            DrawerItemsListTile(
              label: 'Plugin Settings',
              icon: Icons.tune,
              isConnected: false,
              onPressed: () {
                Navigator.pushNamed(context, PluginSettingsScreen.id);
              },
            ),
          ],
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
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: isLightTheme(context) ? Colors.black54 : Colors.white54),
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

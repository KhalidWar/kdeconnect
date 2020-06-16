import 'package:flutter/material.dart';
import 'package:sample/screens/home_screen.dart';
import 'package:sample/screens/pair_new_device_screen.dart';
import 'package:sample/screens/plugin_settings_screen.dart';
import 'package:sample/screens/trusted_networks_screen.dart';

import 'constants.dart';
import 'screens/pair_new_device_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        primaryColorLight: kPrimaryColorLight,
        primaryColorDark: kPrimaryColorDark,
        accentColor: kPrimaryColor,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kDarkPrimaryColor,
        primaryColorLight: kDarkPrimaryColorLight,
        primaryColorDark: kDarkPrimaryColorDark,
        accentColor: kPrimaryColor,
      ),
      routes: {
        SettingsScreen.id: (context) => SettingsScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        PairNewDevice.id: (context) => PairNewDevice(),
        PluginSettingsScreen.id: (context) => PluginSettingsScreen(),
        TrustedNetworksScreen.id: (context) => TrustedNetworksScreen(),
      },
      initialRoute: HomeScreen.id,
      // todo implement Splash screen
    );
  }
}

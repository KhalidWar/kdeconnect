import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/screens/home_screen.dart';
import 'package:sample/screens/pair_new_device_screen.dart';
import 'package:sample/screens/plugin_settings_screen.dart';
import 'package:sample/screens/trusted_networks_screen.dart';
import 'package:sample/services/theme_manager.dart';

import 'constants.dart';
import 'screens/pair_new_device_screen.dart';
import 'screens/settings_screen.dart';
import 'services/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: kAppTitle,
            theme: themeManager.isDark ? darkTheme : lightTheme,
            darkTheme: darkTheme,
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
        },
      ),
    );
  }
}

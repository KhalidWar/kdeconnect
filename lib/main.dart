import 'package:flutter/material.dart';
import 'package:kdeconnect/screens/home_screen.dart';
import 'package:kdeconnect/screens/pair_new_device_screen.dart';
import 'package:kdeconnect/screens/plugin_settings_screen.dart';
import 'package:kdeconnect/screens/settings_screen.dart';
import 'package:kdeconnect/screens/trusted_networks_screen.dart';
import 'package:kdeconnect/services/themes.dart';
import 'package:provider/provider.dart';

import 'providers/theme_manager.dart';

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
            title: 'KDE Connect Sample',
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
// todo test test test

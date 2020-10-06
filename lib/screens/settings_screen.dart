import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';
import 'package:kdeconnect/screens/plugin_settings_screen.dart';
import 'package:kdeconnect/screens/trusted_networks_screen.dart';
import 'package:kdeconnect/widgets/about_app_dialog.dart';
import 'package:kdeconnect/widgets/encryption_info.dart';
import 'package:kdeconnect/widgets/reusable_inkwell_settings.dart';
import 'package:provider/provider.dart';

String deviceName = 'Note 8';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var githubRepoURL = 'https://github.com/KhalidWar/kdeconnect-sample';
  String textFieldInput;

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Dark Theme',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w500)),
                    Consumer<ThemeManager>(
                      builder: (context, themeManager, child) => Switch(
                        activeColor: Theme.of(context).accentColor,
                        value: themeManager.isDark,
                        onChanged: (value) {
                          setState(() {
                            themeManager.toggleTheme();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ReusableInkWellSettings(
                title: 'Device Name',
                subtitle: deviceName,
                onPressed: () {
                  showModal(
                    context: context,
                    builder: (BuildContext context) {
                      return deviceRenameAlertDialog();
                    },
                  );
                },
              ),
              ReusableInkWellSettings(
                title: 'Persistent Notification',
                subtitle: 'Tap to enable/disable in Notification Settings',
                onPressed: () {
                  // todo onTap opens App notification setting
                },
              ),
              ReusableInkWellSettings(
                title: 'Trusted Networks',
                subtitle: 'Restrict autodiscovery to known networks',
                onPressed: () {
                  Navigator.pushNamed(context, TrustedNetworksScreen.id);
                },
              ),
              ReusableInkWellSettings(
                title: 'Encryption Info',
                subtitle: 'Show SHA1 Fingerprint for connected devices.',
                onPressed: () {
                  showModal(
                    context: context,
                    builder: (BuildContext context) {
                      return EncryptionInfo();
                    },
                  );
                },
              ),
              ReusableInkWellSettings(
                title: 'More Settings',
                subtitle:
                    'Tap to navigate to "Plugin Settings" as more per device settings can be found there.',
                onPressed: () {
                  Navigator.pushNamed(context, PluginSettingsScreen.id);
                },
              ),
              ReusableInkWellSettings(
                title: 'Credits',
                subtitle: 'Giving credit where credit is due',
                onPressed: () {
                  // todo give credits
                  //  AlertDialog creditsDialog(BuildContext context) {
                  //    return AlertDialog(
                  //      title: Text('Image Credit'),
                  //      content: Text(songsList[songListIndex].credit),
                  //      actions: <Widget>[
                  //        FlatButton(
                  //          child: Text('Visit Image Source'),
                  //          onPressed: () {
                  //            Navigator.pop(context);
                  //            visitImageSource();
                  //          },
                  //        ),
                  //        FlatButton(
                  //          child: Text('Cancel'),
                  //          onPressed: () {
                  //            Navigator.pop(context);
                  //          },
                  //        )
                  //      ],
                  //    );
                  //  }
                },
              ),
              ReusableInkWellSettings(
                title: 'About App',
                subtitle: 'Tap for more information about app',
                onPressed: () {
                  showModal(
                      context: context,
                      builder: (BuildContext context) {
                        return AboutAppDialog(
                          themedColor: themedColor,
                          url: githubRepoURL,
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog deviceRenameAlertDialog() {
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    return AlertDialog(
      title: Text('Rename device'),
      content: TextFormField(
        initialValue: deviceName,
        autofocus: true,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: themedColor,
            ),
          ),
        ),
        onChanged: (value) {
          textFieldInput = value;
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Rename',
            style: TextStyle(color: themedColor),
          ),
          onPressed: () {
            setState(() {
              deviceName = textFieldInput;
              Navigator.of(context).pop();
            });
          },
        ),
        FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(color: themedColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

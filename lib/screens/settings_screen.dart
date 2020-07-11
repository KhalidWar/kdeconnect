import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/constants.dart';
import 'package:sample/screens/plugin_settings_screen.dart';
import 'package:sample/screens/trusted_networks_screen.dart';
import 'package:sample/services/theme_manager.dart';

String deviceName = 'Note 8';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String textFieldInput;

  Widget deviceNameChanger() {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kSettingsText)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dark Theme',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
              SizedBox(height: 25),
              Column(
                children: <Widget>[
                  //todo finish adding accent color customization
                  ReusableInkWellSettings(
                    title: 'Accent Color',
                    subtitle: 'Select an accent color',
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        color: Colors.orange,
                      ),
                      Container(
                        height: 20,
                        color: Colors.orange,
                      ),
                      Container(
                        height: 20,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
              ReusableInkWellSettings(
                title: 'Device Name',
                subtitle: deviceName,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return deviceRenameAlertDialog(context);
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EncryptionInfo();
                      });
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
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog deviceRenameAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Rename device'),
      content: TextFormField(
        initialValue: deviceName,
        autofocus: true,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onChanged: (value) {
          textFieldInput = value;
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Rename',
            style: TextStyle(color: Theme.of(context).accentColor),
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
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class ReusableInkWellSettings extends StatelessWidget {
  const ReusableInkWellSettings({
    Key key,
    this.title,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black54 : Colors.white54;

    return Container(
      height: 75,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: kSettingsDeviceNameTextStyle,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: themedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EncryptionInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(kEncryptionInfoText),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(kThisDeviceFingerprintText, style: kDeviceFingerprintText),
            SizedBox(height: 5),
            Text(kThisDeviceFingerprint),
            SizedBox(height: 20),
            Text(kRemoteDeviceFingerprintText, style: kDeviceFingerprintText),
            SizedBox(height: 5),
            Text(kRemoteDeviceFingerprint),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(kDoneText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

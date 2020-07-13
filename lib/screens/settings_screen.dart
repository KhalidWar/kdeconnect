import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';
import 'package:kdeconnect/screens/plugin_settings_screen.dart';
import 'package:kdeconnect/screens/trusted_networks_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    bool switchValue = false;
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ReusableInkWellSettings(
                      title: 'Themes', subtitle: 'Select accent color'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 60,
                          width: 60,
                          color: Colors.orange,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        color: Colors.red,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                  SwitchListTile(
                    title: Text('Color fill top and bottom bars'),
                    value: switchValue,
                    subtitle: Text(
                        'Fill top App bar and Bottom Navigation bar with accent color'),
                    onChanged: (toggle) {
                      setState(() {
                        switchValue =
                            toggle == false ? toggle = true : toggle = false;
                      });
                    },
                  ),
                  Consumer<ThemeManager>(
                    builder: (context, themeManager, child) => SwitchListTile(
                      title: Text('Dark Theme'),
                      value: themeManager.isDark,
                      subtitle: Text('Force dark theme'),
                      onChanged: (toggle) {
                        themeManager.toggleTheme();
                      },
                    ),
                  ),
                ],
              ),
//              Container(
//                height: 70,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text('Dark Theme',
//                        style: TextStyle(
//                            fontSize: 25.0, fontWeight: FontWeight.w500)),
//                    Consumer<ThemeManager>(
//                      builder: (context, themeManager, child) => Switch(
//                        activeColor: Theme.of(context).accentColor,
//                        value: themeManager.isDark,
//                        onChanged: (value) {
//                          setState(() {
//                            themeManager.toggleTheme();
//                          });
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ),
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

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog({
    Key key,
    @required this.themedColor,
    @required this.url,
  }) : super(key: key);

  final Color themedColor;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('KDE Connect - Sample'),
      content: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'This app is developed as a UI/UX demo by an independent developer and is not associated with KDE team.'),
            SizedBox(height: 10),
            Text(
                'To see the source code for this free and open-source app, please visit our github repo.'),
          ],
        ),
      ),
      actions: [
        OutlineButton(
          child: Text(
            'Visit Github repo',
            style: TextStyle(color: themedColor),
          ),
          onPressed: () async {
            if (await canLaunch(url)) {
              await launch(url, forceSafariVC: false);
            }
            Navigator.pop(context);
          },
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
        OutlineButton(
          child: Text(
            'Close',
            style: TextStyle(color: themedColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          borderSide: BorderSide(color: Theme.of(context).accentColor),
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
      height: 70,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
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
      title: Text('Encryption Info'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'SHA1 Fingerprint of Your Device Certificate:',
            ),
            SizedBox(height: 5),
            Text(
              '00:00:00:00:00:00:00:00:00:00:00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'SHA1 Fingerprint of Remote Device Certificate:',
            ),
            SizedBox(height: 5),
            Text(
              '00:00:00:00:00:00:00:00:00:00:00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Done',
              style: TextStyle(
                  color: isLightTheme(context) ? Colors.black : Colors.white)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

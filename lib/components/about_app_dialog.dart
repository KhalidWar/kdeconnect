import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo route to project's public github repo
    var url = 'https://github.com/KhalidWar/kdeconnect-sample';
    return GestureDetector(
      onTap: () {
        showAboutDialog(
          context: context,
          applicationIcon: Image.asset('assets/icons/icon.png'),
          applicationVersion: kAppVersion,
          children: [
            Text(
                'This app is developed as a UI/UX demo by an independent developer and is not associated with KDE team.'),
            SizedBox(height: 10),
            Text(
                'To see the source code for this free and open-source app, please visit our github repo.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.github,
                    size: 50,
                  ),
                  onPressed: () async {
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
      child: Text(
        'About',
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
    );
  }
}

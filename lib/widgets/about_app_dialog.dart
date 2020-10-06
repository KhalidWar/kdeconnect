import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

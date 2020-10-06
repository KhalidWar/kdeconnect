import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

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

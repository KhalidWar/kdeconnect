import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

import 'home_screen.dart';

class RemoteInputTab extends StatefulWidget {
  static const String id = kRemoteInputIDText;

  @override
  _RemoteInputTabState createState() => _RemoteInputTabState();
}

class _RemoteInputTabState extends State<RemoteInputTab> {
  bool showTextField = false;
  Widget buildTextField() {
    if (showTextField == true) {
      return TextField(
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(),
          hintText: 'Remote Device Input',
          prefixIcon: Icon(Icons.keyboard),
        ),
      );
    } else {
      return Container();
    }
  }

  void textFieldSwitcher() {
    showTextField = !showTextField;
  }

  @override
  Widget build(BuildContext context) {
    var themedTextStyle = TextStyle(
      fontSize: 15,
      color: isLightTheme(context) ? Colors.black54 : Colors.white54,
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: showTextField ? kFABKeyboardDownIcon : kFABKeyboardUpIcon,
        onPressed: () {
          setState(() {
            // todo keyboard "done" and physical back buttons should trigger textFieldSwitcher()
            textFieldSwitcher();
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            buildTextField(),
            Expanded(
              child: FlatButton(
                splashColor: kPrimaryColor,
                onPressed: () {
                  print('GESTURE TOUCHED!');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      kRemoteInputCenterText,
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      kRemoteInputCenter2Text,
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      kRemoteInputCenter4Text,
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      kRemoteInputCenter3Text,
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

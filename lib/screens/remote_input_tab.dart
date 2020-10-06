import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

import '../constants.dart';

class RemoteInputTab extends StatefulWidget {
  static const String id = kRemoteInputIDText;

  @override
  _RemoteInputTabState createState() => _RemoteInputTabState();
}

class _RemoteInputTabState extends State<RemoteInputTab> {
  bool showTextField = false;

  void textFieldSwitcher() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  Widget buildTextField() {
    if (showTextField == true) {
      return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: TextField(
          autofocus: true,
          onSubmitted: (value) => textFieldSwitcher(),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: 'Remote Device Input',
              prefixIcon: Icon(Icons.keyboard,
                  color: isLightTheme(context) ? Colors.black : Colors.white)),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var themedTextStyle = TextStyle(
        fontSize: 15,
        color: isLightTheme(context) ? Colors.black54 : Colors.white54);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: showTextField ? kFABKeyboardDownIcon : kFABKeyboardUpIcon,
          onPressed: () {
            // todo physical back buttons should trigger textFieldSwitcher()
            textFieldSwitcher();
          }),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            buildTextField(),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Move finger on screen to move mouse cursor.',
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tap to click.',
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Use 2 fingers to scroll.',
                      textAlign: TextAlign.center,
                      style: themedTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Use two/three fingers for right and middle buttons.',
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

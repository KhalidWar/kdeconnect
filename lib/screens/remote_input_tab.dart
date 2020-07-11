import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'package:sample/services/theme_manager.dart';

class RemoteInputTab extends StatefulWidget {
  static const String id = kRemoteInputIDText;

  @override
  _RemoteInputTabState createState() => _RemoteInputTabState();
}

class _RemoteInputTabState extends State<RemoteInputTab> {
  bool showTextField = false;
  Widget buildTextField() {
    if (showTextField == true) {
      return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: TextField(
          autofocus: true,
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

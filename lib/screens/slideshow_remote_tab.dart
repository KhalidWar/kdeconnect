import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

import '../constants.dart';

class SlideshowRemoteTab extends StatefulWidget {
  static const String id = kSlideshowRemoteIDText;

  @override
  _SlideshowRemoteTabState createState() => _SlideshowRemoteTabState();
}

class _SlideshowRemoteTabState extends State<SlideshowRemoteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                  'You can lock your device and use the volume keys to go to the previous/next slide'),
            ),
            Expanded(
              flex: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FlatButton(
                        color: isLightTheme(context)
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                        child: Icon(Icons.skip_previous),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FlatButton(
                        color: isLightTheme(context)
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                        child: Icon(Icons.skip_next),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: FlatButton(
                  color: isLightTheme(context)
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                  child: Text('Pointer'),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

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
              padding: EdgeInsets.all(5.0),
              child: Text(kSlideshowInstructionText),
            ),
            Expanded(
              flex: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FlatButton(
                        color: kPrimaryColor,
                        child: Icon(Icons.skip_previous),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FlatButton(
                        color: kPrimaryColor,
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
                padding: EdgeInsets.all(5.0),
                child: FlatButton(
                  color: kPrimaryColor,
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

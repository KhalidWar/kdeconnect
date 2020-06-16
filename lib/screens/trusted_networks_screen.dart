import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

class TrustedNetworksScreen extends StatefulWidget {
  static const String id = 'trusted_networks_screen';
  @override
  _TrustedNetworksScreenState createState() => _TrustedNetworksScreenState();
}

class _TrustedNetworksScreenState extends State<TrustedNetworksScreen> {
  bool isChecked = true;

  checkboxController() {
    isChecked = !isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kTrustedNetworksText)),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  checkboxController();
                });
              },
            ),
            Text(
              'Allow All',
            ),
          ],
        ),
      ),
    );
  }
}

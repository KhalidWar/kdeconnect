import 'package:flutter/material.dart';

class TrustedNetworksScreen extends StatefulWidget {
  static const String id = 'trusted_networks_screen';
  @override
  _TrustedNetworksScreenState createState() => _TrustedNetworksScreenState();
}

class _TrustedNetworksScreenState extends State<TrustedNetworksScreen> {
  bool _isChecked = true;

  checkboxController() {
    _isChecked = !_isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trusted Networks')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: _isChecked,
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

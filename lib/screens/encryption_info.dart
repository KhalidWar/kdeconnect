import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

class EncryptionInfo extends StatefulWidget {
  static const String id = 'encryption_info';

  @override
  _EncryptionInfoState createState() => _EncryptionInfoState();
}

class _EncryptionInfoState extends State<EncryptionInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kEncryptionInfoText)),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              kThisDeviceFingerprintText,
              style: kDeviceFingerprintText,
            ),
            Card(
              child: Text(kThisDeviceFingerprint),
            ),
            Text(
              kRemoteDeviceFingerprintText,
              style: kDeviceFingerprintText,
            ),
            Card(
              child: Text(
                kRemoteDeviceFingerprint,
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

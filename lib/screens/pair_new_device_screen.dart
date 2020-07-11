import 'package:flutter/material.dart';
import 'package:sample/components/connected_devices_list.dart';
import 'package:sample/components/device_simple_dialog.dart';
import 'package:sample/components/devices_list_tile.dart';
import 'package:sample/constants.dart';
import 'package:sample/services/theme_manager.dart';

class PairNewDevice extends StatefulWidget {
  static const String id = 'paid_new_device_screen';
  @override
  _PairNewDeviceState createState() => _PairNewDeviceState();
}

class _PairNewDeviceState extends State<PairNewDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kPairNewDeviceText),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(kPairNewDeviceHeadlineText,
                style: kPairNewDeviceHeadlineTextStyle),
            SizedBox(height: 20),
            Text(kConnectedDevicesText, style: kConnectedDevicesTextStyle),
            Divider(
              endIndent: 25,
              height: 2,
              color: isLightTheme(context) ? Colors.black54 : Colors.white54,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: connectedDevicesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return DevicesListTile(
                    label: connectedDevicesList[index].label,
                    icon: connectedDevicesList[index].icon,
                    isConnected: false,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeviceSimpleDialog();
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              child: Text(
                'Please make sure both devices are on the same network and neither of them is on VPN.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

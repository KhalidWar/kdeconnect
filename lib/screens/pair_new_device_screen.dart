import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/dummy_data/connected_devices_list.dart';
import 'package:kdeconnect/providers/theme_manager.dart';
import 'package:kdeconnect/widgets/device_simple_dialog.dart';
import 'package:kdeconnect/widgets/devices_list_tile.dart';

class PairNewDevice extends StatefulWidget {
  static const String id = 'paid_new_device_screen';
  @override
  _PairNewDeviceState createState() => _PairNewDeviceState();
}

class _PairNewDeviceState extends State<PairNewDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pair New Device')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Other devices running KDE Connect in your same network should appear here.',
                style: TextStyle(fontSize: 15)),
            SizedBox(height: 20),
            Text('Connected Devices',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                    isConnected:
                        connectedDevicesList[index].isConnected ? true : false,
                    onPressed: () {
                      showModal(
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

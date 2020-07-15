import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/components/connected_devices_list.dart';
import 'package:kdeconnect/components/device_simple_dialog.dart';
import 'package:kdeconnect/components/devices_list_tile.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

class PairNewDevice extends StatefulWidget {
  static const String id = 'paid_new_device_screen';
  @override
  _PairNewDeviceState createState() => _PairNewDeviceState();
}

class _PairNewDeviceState extends State<PairNewDevice> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.07, vertical: height * 0.3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                  style: BorderStyle.solid,
                  color: Theme.of(context).accentColor)),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Other devices running KDE Connect in your same network should appear here.',
                ),
                SizedBox(height: 20),
                Text('Connected Devices',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Divider(
                  endIndent: 25,
                  height: 2,
                  color:
                      isLightTheme(context) ? Colors.black54 : Colors.white54,
                ),
                SizedBox(height: 5),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: connectedDevicesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DevicesListTile(
                        label: connectedDevicesList[index].label,
                        icon: connectedDevicesList[index].icon,
                        isConnected: connectedDevicesList[index].isConnected,
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
                SizedBox(height: 20),
                Center(
                  child: FlatButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

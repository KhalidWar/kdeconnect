import 'package:flutter/material.dart';
import 'package:sample/constants.dart';

class DeviceSimpleDialog extends StatefulWidget {
  @override
  _DeviceSimpleDialogState createState() => _DeviceSimpleDialogState();
}

class _DeviceSimpleDialogState extends State<DeviceSimpleDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text('What to do?')),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SimpleDialogItem(
            label: kSimpleDialogConnectLabel,
            icon: kSimpleDialogConnectIcon,
          ),
        ),
        SizedBox(height: 10),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SimpleDialogItem(
              icon: kSimpleDialogDisconnectIcon,
              label: kSimpleDialogDisconnectLabel),
        ),
        SizedBox(height: 10),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SimpleDialogItem(
            icon: kSimpleDialogAboutIcon,
            label: kSimpleDialogAboutLabel,
          ),
        )
      ],
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({
    Key key,
    @required this.icon,
    @required this.label,
  }) : super(key: key);

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kPrimaryColor,
      highlightColor: kPrimaryColor,
      child: Column(
        children: <Widget>[
          icon,
          Text(
            label,
            style: kSimpleDialogItemTextStyle,
          ),
        ],
      ),
    );
  }
}

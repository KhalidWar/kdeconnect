import 'package:flutter/material.dart';

class DeviceSimpleDialog extends StatefulWidget {
  @override
  _DeviceSimpleDialogState createState() => _DeviceSimpleDialogState();
}

class _DeviceSimpleDialogState extends State<DeviceSimpleDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //todo try without title
      title: Center(child: Text('What to do?')),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SimpleDialogItem(
            label: 'Connect',
            icon: Icon(Icons.phonelink, size: 60),
          ),
        ),
        SizedBox(height: 10),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SimpleDialogItem(
              icon: Icon(Icons.phonelink_off, size: 60), label: 'Disconnect'),
        ),
        SizedBox(height: 10),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SimpleDialogItem(
            icon: Icon(Icons.info_outline, size: 60),
            label: 'About Device',
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
      splashColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).accentColor,
      child: Column(
        children: <Widget>[
          icon,
          Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

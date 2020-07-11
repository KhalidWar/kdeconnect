import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'package:sample/services/theme_manager.dart';

class DevicesListTile extends StatelessWidget {
  DevicesListTile({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.onPressed,
    @required this.isConnected,
  }) : super(key: key);

  final label;
  final icon;
  final Function onPressed;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    return Container(
      //todo accentColor instead of primaryColorLight
      color: isConnected ? Theme.of(context).accentColor : null,
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        leading: Icon(
          icon,
          color: isConnected ? Colors.black : themedColor,
          size: 30,
        ),
        title: Text(
          label,
          style: kDrawerItemsTextStyle.copyWith(
            color: isConnected ? Colors.black : null,
            fontSize: 20,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}

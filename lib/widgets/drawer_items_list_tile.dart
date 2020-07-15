import 'package:flutter/material.dart';

import '../constants.dart';

class DrawerItemsListTile extends StatelessWidget {
  DrawerItemsListTile({
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
    return Container(
      height: 40,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          //todo accentColor instead of primaryColorLight

          color: isConnected ? Theme.of(context).accentColor : null,
          height: 40,
          padding: EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: isConnected ? Colors.black54 : null,
                    size: 28,
                  ),
                  SizedBox(width: 15),
                  Text(
                    label,
                    style: kDrawerItemsTextStyle.copyWith(
                      color: isConnected ? Colors.black54 : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

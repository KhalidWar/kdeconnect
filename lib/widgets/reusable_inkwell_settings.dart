import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

class ReusableInkWellSettings extends StatelessWidget {
  const ReusableInkWellSettings({
    Key key,
    this.title,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black54 : Colors.white54;

    return Container(
      height: 70,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: themedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

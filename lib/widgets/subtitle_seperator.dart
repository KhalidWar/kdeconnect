import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

class SubtitleSeparator extends StatelessWidget {
  const SubtitleSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // todo align separator to the middle
      child: Text(
        '-',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isLightTheme(context) ? Colors.black54 : Colors.white54,
        ),
      ),
    );
  }
}

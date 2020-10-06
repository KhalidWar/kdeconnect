import 'package:flutter/material.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

class SendFilesListSubtitle extends StatelessWidget {
  const SendFilesListSubtitle({
    Key key,
    @required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
      child: Text(
        category,
        style: TextStyle(
          color: isLightTheme(context) ? Colors.black54 : Colors.white54,
        ),
      ),
    );
  }
}

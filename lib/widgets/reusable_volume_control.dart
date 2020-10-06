import 'package:flutter/material.dart';

class ReusableVolumeControl extends StatelessWidget {
  ReusableVolumeControl({
    @required this.value,
    @required this.min,
    @required this.max,
    @required this.function,
    @required this.trailingIcon,
  });

  final Icon trailingIcon;
  final double value;
  final double min;
  final double max;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.volume_up),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Slider(
            value: value,
            min: min,
            max: max,
            activeColor: Theme.of(context).accentColor,
            onChanged: function,
          ),
        ),
        trailingIcon,
      ],
    );
  }
}

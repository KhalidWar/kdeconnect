import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/dummy_data/songs_list.dart';
import 'package:kdeconnect/widgets/reusable_volume_control.dart';

import '../constants.dart';

class MediaControlTab extends StatefulWidget {
  static const String id = kMediaControlIDText;

  @override
  _MediaControlTabState createState() => _MediaControlTabState();
}

class _MediaControlTabState extends State<MediaControlTab> {
  int _songListIndex = 0;

  double sliderValue = 0;
  double sliderMinValue = 0;
  double sliderMaxValue = 100;

  double phoneVolumeValue = 80;
  double phoneVolumeMinValue = 0;
  double phoneVolumeMaxValue = 100;

  double computerVolumeValue = 20;
  double computerVolumeMinValue = 0;
  double computerVolumeMaxValue = 100;

  double bluetoothVolumeValue = 50;
  double bluetoothVolumeMinValue = 0;
  double bluetoothVolumeMaxValue = 100;

  bool _isPlaying = false;
  bool _isSoundPlaying = true;

  void _playOrPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _soundOrMute() {
    setState(() {
      _isSoundPlaying = !_isSoundPlaying;
    });
  }

  String selectedPlayer = 'Mozilla Firefox';
  List mediaPlayers = [
    'Mozilla Firefox',
    'Elisa',
    'VLC media player',
  ];

  void nextSong() {
    if (_songListIndex < songsList.length - 1) {
      _songListIndex++;
    } else {
      _songListIndex = 0;
    }
  }

  void previousSong() {
    if (_songListIndex < songsList.length && _songListIndex > 0) {
      _songListIndex--;
    } else {
      _songListIndex = 1;
    }
  }

  DropdownButton _getDropdownButton() {
    List<DropdownMenuItem> dropdownMenuItems = [];

    for (String mediaPlayer in mediaPlayers) {
      var newItem = DropdownMenuItem(
        value: mediaPlayer,
        child: Text(mediaPlayer),
      );
      dropdownMenuItems.add(newItem);
    }
    return DropdownButton(
      value: selectedPlayer,
      items: dropdownMenuItems,
      onChanged: (value) {
        setState(() {
          selectedPlayer = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Center(child: _getDropdownButton()),
            Expanded(
              child: Image.asset(
                songsList[_songListIndex].image,
              ),
            ),
            Text(
              songsList[_songListIndex].title,
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(sliderMinValue.round().toString()),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Slider(
                    value: sliderValue,
                    min: sliderMinValue,
                    max: sliderMaxValue,
                    activeColor: Theme.of(context).accentColor,
                    inactiveColor: Colors.grey,
                    onChanged: (barValue) {
                      setState(() {
                        sliderValue = barValue;
                      });
                    },
                  ),
                ),
                Text(sliderMaxValue.round().toString()),
              ],
            ),
            SizedBox(height: 8),
            // todo re-design multimedia controls
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.stop, size: 20),
                    onPressed: () {
                      setState(() {
                        sliderValue = 0;
                        _isPlaying = false;
                      });
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.fast_rewind, size: 35),
                          onPressed: () {
                            setState(() {
                              previousSong();
                            });
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 80,
                            color: Theme.of(context).accentColor,
                          ),
                          onTap: () {
                            _playOrPause();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.fast_forward, size: 35),
                          onPressed: () {
                            setState(() {
                              nextSong();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _soundOrMute();
                      });
                    },
                    child: IconButton(
                      icon: _isSoundPlaying
                          ? Icon(Icons.volume_up)
                          : Icon(Icons.volume_off,
                              color: Theme.of(context).accentColor),
                      onPressed: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return bottomSheetStatefulBuilder();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  StatefulBuilder bottomSheetStatefulBuilder() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  Text(
                    selectedPlayer,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.volume_off,
                      color: _isSoundPlaying
                          ? null
                          : Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      setModalState(() {
                        _soundOrMute();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ReusableVolumeControl(
                  value: phoneVolumeValue,
                  min: phoneVolumeMinValue,
                  max: phoneVolumeMaxValue,
                  trailingIcon: Icon(Icons.phone_android),
                  function: (value) {
                    setModalState(() {
                      phoneVolumeValue = value;
                    });
                  }),
              ReusableVolumeControl(
                  value: computerVolumeValue,
                  min: computerVolumeMinValue,
                  max: computerVolumeMaxValue,
                  trailingIcon: Icon(Icons.computer),
                  function: (value) {
                    setModalState(() {
                      computerVolumeValue = value;
                    });
                  }),
              ReusableVolumeControl(
                  value: bluetoothVolumeValue,
                  min: bluetoothVolumeMinValue,
                  max: bluetoothVolumeMaxValue,
                  trailingIcon: Icon(Icons.bluetooth_audio),
                  function: (value) {
                    setModalState(() {
                      bluetoothVolumeValue = value;
                    });
                  }),
            ],
          ),
        );
      },
    );
  }
}

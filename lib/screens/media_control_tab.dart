import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/components/songs_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class MediaControlTab extends StatefulWidget {
  static const String id = kMediaControlIDText;

  @override
  _MediaControlTabState createState() => _MediaControlTabState();
}

class _MediaControlTabState extends State<MediaControlTab> {
  String currentlyPlaying = 'Michael Bublé - Feeling Good';
  int songListIndex = 0;

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

  bool isPlaying = false;
  bool isSoundPlaying = true;

  playOrPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  soundOrMute() {
    setState(() {
      isSoundPlaying = !isSoundPlaying;
    });
  }

  String selectedPlayer = 'Mozilla Firefox';
  List mediaPlayers = [
    'Mozilla Firefox',
    'Elisa',
    'VLC media player',
  ];

  void nextSong() {
    if (songListIndex < songsList.length - 1) {
      songListIndex++;
    } else {
      songListIndex = 0;
    }
  }

  void previousSong() {
    if (songListIndex < songsList.length && songListIndex > 0) {
      songListIndex--;
    } else {
      songListIndex = 1;
    }
  }

  visitImageSource() async {
    var url = songsList[songListIndex].url;
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    }
  }

  DropdownButton getDropdownButton() {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: getDropdownButton()),
            Expanded(
                child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.asset(
                  songsList[songListIndex].image,
                ),
                Positioned(
                  top: 95,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Image Credit'),
                                content: Text(songsList[songListIndex].credit),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Visit Image Source'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      visitImageSource();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      });
                    },
                  ),
                ),
              ],
            )),
            Text(
              songsList[songListIndex].title,
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
            Divider(thickness: 1),
            // todo re-design multimedia controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.stop, size: 20),
                  onPressed: () {
                    setState(() {
                      sliderValue = 0;
                      isPlaying = false;
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
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 80,
                          color: Theme.of(context).accentColor,
                        ),
                        onTap: () {
                          playOrPause();
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
                      soundOrMute();
                    });
                  },
                  child: IconButton(
                    icon: isSoundPlaying
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
                      color:
                          isSoundPlaying ? null : Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      setModalState(() {
                        soundOrMute();
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

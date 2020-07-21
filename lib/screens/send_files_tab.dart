import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kdeconnect/dummy_data/send_files_list.dart';
import 'package:kdeconnect/providers/theme_manager.dart';

import '../constants.dart';

class SendFilesTab extends StatefulWidget {
  static const String id = kSendFilesIDText;
  @override
  _SendFilesTabState createState() => _SendFilesTabState();
}

class _SendFilesTabState extends State<SendFilesTab> {
  String _currentTime() {
    return '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}';
  }

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.note_add, size: 43),
          onPressed: () {
            showModal(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Permission Notice'),
                    content: Text(
                        'This app is a demo and doesn\'t need to access device storage but this is how you select a file to send to connected device.'),
                    actions: <Widget>[
                      FlatButton(
                        textColor:
                            isLightTheme(context) ? Colors.black : Colors.white,
                        child: Text('Okay'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          },
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recents',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  OutlineButton(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                    child: Text('Clear All'),
                    onPressed: () {
                      showModal(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                'Are you sure you want to Clear All?',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              actions: [
                                FlatButton(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: themedColor, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        color: themedColor, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
              Divider(thickness: 1),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 70,
                                child: Icon(
                                  filesList[index].icon,
                                  size: 45,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    filesList[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SendFilesListSubtitle(
                                          category: filesList[index].type),
                                      SubtitleSeparator(),
                                      SendFilesListSubtitle(
                                          category: filesList[index].size),
                                      SubtitleSeparator(),
                                      SendFilesListSubtitle(
                                          category: _currentTime()),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

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

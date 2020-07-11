import 'package:flutter/material.dart';
import 'package:sample/components/send_files_list.dart';
import 'package:sample/constants.dart';
import 'package:sample/services/theme_manager.dart';

class SendFilesTab extends StatefulWidget {
  static const String id = kSendFilesIDText;
  @override
  _SendFilesTabState createState() => _SendFilesTabState();
}

class _SendFilesTabState extends State<SendFilesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: kFABPlusIcon,
          onPressed: () {
            showDialog(
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
                    child: Text('clear all'),
                    onPressed: () {},
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
                                      ReusableFileListSubtitle(
                                          category: filesList[index].type),
                                      DotSeparator(),
                                      ReusableFileListSubtitle(
                                          category: filesList[index].size),
                                      DotSeparator(),
                                      ReusableFileListSubtitle(
                                          category: 'date'),
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

class DotSeparator extends StatelessWidget {
  const DotSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text(
        '.',
        style: TextStyle(
          color: isLightTheme(context) ? Colors.black54 : Colors.white54,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class ReusableFileListSubtitle extends StatelessWidget {
  const ReusableFileListSubtitle({
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

import 'package:flutter/material.dart';
import 'package:sample/components/run_command_list.dart';
import 'package:sample/constants.dart';

enum SortBy { AZ, ZA, Color }

class RunCommandTab extends StatefulWidget {
  static const String id = kRunCommandIDText;

  @override
  _RunCommandTabState createState() => _RunCommandTabState();
}

class _RunCommandTabState extends State<RunCommandTab> {
  String textFieldInput;
  bool showTextField = false;
  bool isSortByAZ = false;

  SortBy _sortBy = SortBy.AZ;

  // todo implement search functionality
  bool isTextFieldEmpty() {
    if (showTextField == true) {
//      if (textFieldInput.isEmpty) {
//        return true;
//      } else {
//        return false;
//      }
    }
    return false;
  }

  void textFieldSwitcher() {
    showTextField = !showTextField;
  }

  Widget buildTextField() {
    if (showTextField == true) {
      return TextField(
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            textFieldInput = value;
          }
        },
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.sort),
                SizedBox(width: 10),
                Text('Sort by:', style: TextStyle(fontSize: 15)),
              ],
            ),
            Spacer(),
            Row(
              children: <Widget>[
                Radio(
                  value: SortBy.AZ,
                  groupValue: _sortBy,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      _sortBy = value;
                    });
                  },
                ),
                Text('AZ'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: SortBy.Color,
                  groupValue: _sortBy,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      _sortBy = value;
                    });
                  },
                ),
                Text('Color'),
              ],
            ),
          ],
        ),
      );
    }
  }

// todo implement sort functionality

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: showTextField ? kFABKeyboardDownIcon : kFABSearchIcon,
        onPressed: () {
          setState(() {
            textFieldSwitcher();
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                buildTextField(),
              ],
            ),
            Divider(thickness: 1),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: runCommandsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      title: Text(
                        runCommandsList[index].title,
                        style: runCommandsList[index].isRedCommand
                            ? kCommandsLabelTextStyle.copyWith(
                                color: Colors.red)
                            : kCommandsLabelTextStyle,
                      ),
                      subtitle: Text(runCommandsList[index].subtitle),
                      onTap: () {
                        setState(() {
                          if (showTextField == true) {
                            textFieldSwitcher();
                          }
                          if (runCommandsList[index].isRedCommand == true) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return RedCommandsConfirmation(index: index);
                                });
                          } else {
                            runCommandsList[index].function();
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RedCommandsConfirmation extends StatelessWidget {
  const RedCommandsConfirmation({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Are you sure you want to ${runCommandsList[index].title}?',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('No', style: TextStyle(fontSize: 20)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Yes', style: TextStyle(fontSize: 20)),
          onPressed: () {
            Navigator.pop(context);
            runCommandsList[index].function();
          },
        ),
      ],
    );
  }
}

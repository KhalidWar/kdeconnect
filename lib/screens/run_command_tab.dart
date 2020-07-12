import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/components/run_command_list.dart';
import 'package:sample/constants.dart';
import 'package:sample/providers/theme_manager.dart';

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

  // todo implement sort functionality

  void textFieldSwitcher() {
    setState(() {
      showTextField = !showTextField;
    });
  }

  Widget searchOrSortBuilder() {
    if (showTextField == true) {
      return searchTextField();
    } else {
      return sortBy();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:
            showTextField ? kFABKeyboardDownIcon : Icon(Icons.search, size: 43),
        onPressed: () {
          textFieldSwitcher();
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            searchOrSortBuilder(),
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
                        if (showTextField == true) {
                          textFieldSwitcher();
                        }
                        if (runCommandsList[index].isRedCommand == true) {
                          showModal(
                              context: context,
                              builder: (context) {
                                return RedCommandsConfirmation(index: index);
                              });
                        } else {
                          runCommandsList[index].function();
                        }
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

  Row searchTextField() {
    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              prefixIcon: Icon(Icons.search,
                  color: isLightTheme(context) ? Colors.black : Colors.white),
            ),
            onSubmitted: (value) => textFieldSwitcher(),
            onChanged: (value) {
              if (value.isNotEmpty) {
                textFieldInput = value;
              }
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.14,
          height: 45,
          child: OutlineButton(
            highlightedBorderColor: Theme.of(context).accentColor,
            shape: CircleBorder(),
            borderSide: BorderSide(
                style: BorderStyle.solid, color: Theme.of(context).accentColor),
            child: Icon(Icons.add),
            onPressed: () {
              textFieldSwitcher();
              showModal(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add Command'),
                      content: Text('You can add commands on the desktop.'),
                      actions: <Widget>[
                        FlatButton(
                          textColor: isLightTheme(context)
                              ? Colors.black
                              : Colors.white,
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
        ),
      ],
    );
  }

  Container sortBy() {
    return Container(
      // todo animate the switching
//          transform: ,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).accentColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11),
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
            Row(
              children: <Widget>[
                Radio(
                  value: SortBy.AZ,
                  groupValue: _sortBy,
                  onChanged: (value) {
                    setState(() {
                      _sortBy = value;
                    });
                  },
                ),
                Text('AZ'),
                Radio(
                  value: SortBy.Color,
                  groupValue: _sortBy,
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
          child: Text('Yes',
              style: TextStyle(
                  color: isLightTheme(context) ? Colors.black : Colors.white,
                  fontSize: 20)),
          onPressed: () {
            Navigator.pop(context);
            runCommandsList[index].function();
          },
        ),
        FlatButton(
          child: Text('No',
              style: TextStyle(
                  color: isLightTheme(context) ? Colors.black : Colors.white,
                  fontSize: 20)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kdeconnect/screens/media_control_tab.dart';
import 'package:kdeconnect/screens/pair_new_device_screen.dart';
import 'package:kdeconnect/screens/remote_input_tab.dart';
import 'package:kdeconnect/screens/run_command_tab.dart';
import 'package:kdeconnect/screens/send_files_tab.dart';
import 'package:kdeconnect/screens/settings_screen.dart';
import 'package:kdeconnect/screens/slideshow_remote_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void selectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsList[_selectedIndex].widget,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          tabsList[_selectedIndex].title,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.phonelink),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              context: context,
              builder: (context) {
                return PairNewDevice();
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.id);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).accentColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 23),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote),
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mousePointer),
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.terminal),
            title: Text(tabsList[_selectedIndex].title),
          ),
        ],
      ),
    );
  }
}

class Tabs {
  Tabs({this.title, this.widget});

  String title;
  Widget widget;
  Function function;
}

List tabsList = [
  Tabs(
    title: 'Send Files',
    widget: SendFilesTab(),
  ),
  Tabs(
    title: 'Slideshow Remote',
    widget: SlideshowRemoteTab(),
  ),
  Tabs(
    title: 'Multimedia Control',
    widget: MediaControlTab(),
  ),
  Tabs(
    title: 'Remote Input',
    widget: RemoteInputTab(),
  ),
  Tabs(
    title: 'Run Command',
    widget: RunCommandTab(),
  ),
];

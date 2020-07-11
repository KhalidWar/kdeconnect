import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample/components/main_drawer.dart';
import 'package:sample/components/tabs_list.dart';
import 'package:sample/providers/theme_manager.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          backgroundColor: isLightTheme(context)
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorLight,
          title: Text(tabsList[_selectedIndex].title),
        ),
      ),
      drawer: Drawer(child: MainDrawer()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: isLightTheme(context)
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColorLight,
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

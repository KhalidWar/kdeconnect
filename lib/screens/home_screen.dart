import 'package:flutter/material.dart';
import 'package:sample/components/main_drawer.dart';
import 'package:sample/components/tabs_list.dart';
import 'package:sample/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool isLightTheme(context) {
  var isLightTheme = Theme.of(context).brightness == Brightness.light;
  return isLightTheme;
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
        preferredSize: Size.fromHeight(50),
        child: AppBar(title: Text(tabsList[_selectedIndex].title)),
      ),
      drawer: Drawer(child: MainDrawer()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: isLightTheme(context)
            ? Colors.white
            : Theme.of(context).accentColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 25),
        items: [
          BottomNavigationBarItem(
            icon: kSendFilesIcon,
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: kSlideshowRemoteIcon,
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: kMediaControlIcon,
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: kRemoteInputIcon,
            title: Text(tabsList[_selectedIndex].title),
          ),
          BottomNavigationBarItem(
            icon: kRunCommandIcon,
            title: Text(tabsList[_selectedIndex].title),
          ),
        ],
      ),
    );
  }
}

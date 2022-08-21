import 'package:emportal_project/view/screens/contacts.dart';
import 'package:emportal_project/view/screens/messages.dart';
import 'package:emportal_project/view/screens/setting.dart';
import 'package:flutter/material.dart';


import 'home.dart';

class CustomBottomTabbar extends StatefulWidget {
  @override
  _CustomBottomTabbarState createState() => _CustomBottomTabbarState();
}

class _CustomBottomTabbarState extends State<CustomBottomTabbar> {
  int _currentIndex = 0;
  List _screens = [Home(), Contacts(), Messages(), Settings()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Color(0xffFDC500),
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Comtacts",
            icon: Icon(Icons.call),
          ),
          BottomNavigationBarItem(
            label: "Message",
            icon: Icon(Icons.mail_outline),
            // icon: ImageIcon(AssetImage('assets/images/icon.png')),
          ),
          BottomNavigationBarItem(
              label: "Other", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}

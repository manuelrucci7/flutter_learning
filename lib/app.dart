import 'package:flutter/material.dart';
import 'package:learning/login.dart';
import 'package:learning/home.dart';
import 'package:learning/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    const ProfileScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  backgroundColor: Colors.green,
      //  title: const Text(
      //    "Ti va di?",
      //    style: TextStyle(
      //        fontWeight: FontWeight.bold, // Adjust as required
      //        fontSize: 30.0, // Adjust as required
      //        fontStyle: FontStyle.normal),
      //  ),
      //  centerTitle: true,
      //  actions: [
      //    IconButton(
      //      icon: Icon(Icons.logout),
      //      onPressed: _logout,
      //    ),
      //  ],
      //),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'new',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for the unselected items
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

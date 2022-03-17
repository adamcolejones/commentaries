import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:unify/ui/bible.dart';
import 'package:unify/ui/explore.dart';
import 'package:unify/ui/home.dart';


class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  final auth = FirebaseAuth.instance;
  late User user;
  int currentTab = 1; // A: Start on the Bible app

  @override
  void initState() {
    super.initState();
  }

  // A: The Tabs used to cycle between content
  final tabs = [
    const Explore(),
    const Bible(),
    const Home(), 
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return Scaffold(
      // A: IndexedStack helps the app to remember the pages state while switching between tabs
      body: IndexedStack(
        index: currentTab,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        backgroundColor: Colors.red[800],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown[200],
        onTap: (value) {
          setState(() => currentTab = value);
          // const _LoginState().hideNewUserOverlay();
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Community',
            icon: Icon(Icons.auto_awesome_mosaic),
          ),
          BottomNavigationBarItem(
            label: 'Bible',
            icon: Icon(Icons.auto_stories),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }
}

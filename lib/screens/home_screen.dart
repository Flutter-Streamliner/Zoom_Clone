import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/app_styles.dart';

import 'profile_screen.dart';
import 'video_conference_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  List _pageOptions = [
    VideoConferenceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: myStyle(17, Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: myStyle(17, Colors.black),
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(() { _pageIndex = index; });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Video Call',
            icon: Icon(Icons.video_call, size: 32,),
          ),
          BottomNavigationBarItem(
            label: 'Profile ',
            icon: Icon(Icons.person, size: 32,),
          ),
        ],
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout), 
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: _pageOptions[_pageIndex],
    );
  }
}
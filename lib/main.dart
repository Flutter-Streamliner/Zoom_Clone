import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/home_screen.dart';

import 'screens/intro_auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationPage()
    );
  }
}

class NavigationPage extends StatefulWidget {

  const NavigationPage({ Key? key }) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned 
        ? HomeScreen()
        : IntroAuthScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/app_background.dart';
import 'package:zoom_clone/screens/sign_in_screen.dart';
import 'package:zoom_clone/screens/sign_up_screen.dart';
import 'package:zoom_clone/widgets/button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(title: 'SING IN', onClick: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignInScreen()))),
          const SizedBox(height: 40,),
          Button(title: 'SIGN UP', onClick: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen())), buttonColor: ButtonColor.red,),
        ],
      ),
    );
  }
  
}
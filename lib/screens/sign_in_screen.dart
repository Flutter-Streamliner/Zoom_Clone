import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/app_background.dart';
import 'package:zoom_clone/utils/app_styles.dart';
import 'package:zoom_clone/widgets/button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Container(
            width: MediaQuery.of(context).size.width / 1.7,
            child: TextField(
              style: myStyle(18, Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
                hintStyle: myStyle(20, Colors.grey, FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width / 1.7,
            child: TextField(
              style: myStyle(18, Colors.black),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                hintStyle: myStyle(20, Colors.grey, FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          Button(title: 'SING IN', onClick: null),
        ],
      ),
    );
  }
}
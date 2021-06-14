import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/app_background.dart';
import 'package:zoom_clone/utils/app_styles.dart';
import 'package:zoom_clone/utils/refs.dart';
import 'package:zoom_clone/widgets/button.dart';

class SignUpScreen extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
              controller: _emailController,
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
              controller: _usernameController,
              style: myStyle(18, Colors.black),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(Icons.person),
                hintStyle: myStyle(20, Colors.grey, FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width / 1.7,
            child: TextField(
              controller: _passwordController,
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
          Button(title: 'SING UP', onClick: (){
            FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
              .then((signedUser){
                try {
                  userCollection.doc(signedUser.user?.uid).set({
                  'username': _usernameController.text,
                  'email': _emailController.text,
                  'password': _passwordController.text,
                  'uid': signedUser.user?.uid
                  });
                  Navigator.popUntil(context, (route) => route.isFirst);
                } catch (e, stackTrace) {
                  print('Cannot save to firestore $e, $stackTrace');
                }
              } );
          }),
        ],
      ),
    );
  }
}
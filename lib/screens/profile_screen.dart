import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:zoom_clone/utils/app_styles.dart';
import 'package:zoom_clone/utils/refs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String _userName = '';
  bool complete = false;

  @override
  void initState(){
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    DocumentSnapshot userDoc = await userCollection.doc(FirebaseAuth.instance.currentUser?.uid).get();
    Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
    setState(() {
        _userName = data['username'];
        complete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: !complete 
      ? Center(child: LinearProgressIndicator(),)
      : Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  const Color(0xFF00c6ff),
                  const Color(0xFF0072ff),
                ]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 2 - 64,
              top: MediaQuery.of(context).size.height / 3.1,
            ),
            child: CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage('https://www.freeiconspng.com/uploads/person-icon-8.png'),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 300,),
                Text('Username', style: myStyle(40, Colors.black), textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Color(0xFFEB3349), Color(0xFFF45C43)]),
                  ),
                  child: Center(
                    child: Text('Edit Profile', style: myStyle(17, Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
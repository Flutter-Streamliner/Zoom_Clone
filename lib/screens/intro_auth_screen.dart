import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoom_clone/screens/auth_screen.dart';
import 'package:zoom_clone/utils/app_styles.dart';

class IntroAuthScreen extends StatefulWidget {
  const IntroAuthScreen({ Key? key }) : super(key: key);

  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome',
          body: 'Welcome to the best video conference app',
          image: Center(child: Image.asset('images/welcome.png', height: 175,),),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20, Colors.black),
            titleTextStyle: myStyle(20, Colors.black)
          )
        ),
        PageViewModel(
          title: 'Join or start meetings',
          body: 'Easy to use interface, join to start meetings in a fast time',
          image: Center(child: Image.asset('images/conference.png', height: 175,),),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20, Colors.black),
            titleTextStyle: myStyle(20, Colors.black)
          )
        ),
        PageViewModel(
          title: 'Security',
          body: 'Your security is important for us, Our servers are secure and reliable',
          image: Center(child: Image.asset('images/secure.jpg', height: 175,),),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20, Colors.black),
            titleTextStyle: myStyle(20, Colors.black)
          )
        )
      ],
      onDone: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AuthScreen()));
      },
      onSkip: (){

      },
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, size: 45,),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text('Done', style: myStyle(20, Colors.black),),
    );
  }
}
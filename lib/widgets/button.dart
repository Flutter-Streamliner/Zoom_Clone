import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/app_styles.dart';

enum ButtonColor {
  red, green
}

class Button extends StatelessWidget {

  final String title;
  final Function()? onClick;
  final ButtonColor? buttonColor;

  final _greenColors = [
    const Color(0xFF11998e),
    const Color(0xFF38ef7d),
  ];

  final _redColors = [
    const Color.fromRGBO(240, 19, 77, 1),
    const Color.fromRGBO(228, 0, 124, 1)
  ];


  Button({required this.title, required this.onClick, this.buttonColor = ButtonColor.green});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: buttonColor == ButtonColor.green 
              ? _greenColors
              : _redColors,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(title, style: myStyle(30, Colors.white),),
        ),
      ),
    );
  }
}
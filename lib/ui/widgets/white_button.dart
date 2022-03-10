import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final double? customFontSize;
  final customColor;
  final customTextColor;
  final toScreen;
  final buttonFunction;
  const WhiteButton({
    Key? key,
    required this.title,
    this.customFontSize,
    this.customColor,
    this.customTextColor,
    this.toScreen,
    this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: customColor != null ? customColor : Colors.white,
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        if (buttonFunction != null) {
          buttonFunction;
        }
        if (toScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => toScreen,
            ),
          );
        }
      },
      child: Center(
        child: Text(
          '${this.title}',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: customFontSize != null ? customFontSize : 20.0,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: customTextColor != null ? customTextColor : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

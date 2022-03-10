import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/onboarding/school_selection_screen.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_button_custom.dart';

class StartScreen extends StatefulWidget {
  const StartScreen() : super();
  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  _StartScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.705,
              child: Text(
                'Explore Around You',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: getWidth(0.10, context),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.722,
              child: Text(
                'Meet Others',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: getWidth(0.10, context),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // Create account button that redirects you to the onboarding process
          Positioned(
            left: MediaQuery.of(context).size.width * 0.15,
            right: MediaQuery.of(context).size.width * 0.15,
            bottom: MediaQuery.of(context).size.height * 0.33,
            height: MediaQuery.of(context).size.height * 0.060,
            child: RedButton(
              title: 'Create Account',
              toScreen: "schoolSelection",
            ),
          ),
          // Sign In Text button
          Positioned(
            left: MediaQuery.of(context).size.width * 0.15,
            right: MediaQuery.of(context).size.width * 0.15,
            bottom: MediaQuery.of(context).size.height * 0.18,
            height: MediaQuery.of(context).size.height * 0.060,
            child: TextButtonCustom(title: 'Sign In', toScreen: 'signIn'),
          ),
        ],
      ),
    );
  }
}

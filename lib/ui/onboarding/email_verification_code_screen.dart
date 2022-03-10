import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/onboarding/name_screen.dart';
import 'package:vives/ui/onboarding/phone_number_signin_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class EmailVerificationCodeScreen extends StatefulWidget {
  const EmailVerificationCodeScreen({Key? key}) : super(key: key);

  @override
  _EmailVerificationCodeScreenState createState() => _EmailVerificationCodeScreenState();
}

class _EmailVerificationCodeScreenState extends State<EmailVerificationCodeScreen> {
  bool isValid = true;

  changeValidState(bool state) {
    print("~~~~~~~~~~" + state.toString());
    setState(() {
      isValid = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 15.0,
              top: 30.0,
              child: BackButtonCustom(),
            ),
            Positioned(
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.429,
              height: MediaQuery.of(context).size.height * 0.03,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.725,
                  child: Text(
                    'Confirm your Email.\n'
                        'Please check your inbox',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ),
            Positioned(
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.498,
              height: MediaQuery.of(context).size.height * 0.025,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: MediaQuery.of(context).size.width * 0.725,
                  child: Text(
                    'Please check your inbox',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ),
            Positioned(
              left: 50.0,
              right: 51.0,
              top: MediaQuery.of(context).size.height * 0.7,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.756,
                child: Text(
                  isValid ? ''
                      : 'You must verify your email.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: isValid ? Colors.black : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.15,
              height: MediaQuery.of(context).size.height * 0.056,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(getWidth(0.6, context), getHeight(0.05, context)),
                  primary: Color(0xFFFF4D5A),
                  elevation: 3,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser!.reload();
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null && user.emailVerified){
                    BlocProvider.of<OnboardingStageCubit>(context)
                        .provideBloc('name', context);
                  } else {
                   changeValidState(false);
                  }
                },
                child: Center(
                  child: Text(
                    'Confirm Verification',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

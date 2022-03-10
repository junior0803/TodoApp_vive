import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class PhoneVerificationCodeScreen extends StatefulWidget {
  const PhoneVerificationCodeScreen({Key? key}) : super(key: key);

  @override
  _PhoneVerificationCodeScreenState createState() =>
      _PhoneVerificationCodeScreenState();
}

class _PhoneVerificationCodeScreenState
    extends State<PhoneVerificationCodeScreen> {
  TextEditingController _controller = new TextEditingController();

  void signupWithPhone(String phone) async {
    await auth.verifyPhoneNumber(
      codeAutoRetrievalTimeout: (String verificationId) {},
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: (String verificationId, [int? forceResendingToken]) async {
        final code = _controller.text.trim();
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: code);
        await auth.signInWithCredential(credential);
      },
    );
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");

    if (authCredential.smsCode != null) {
      try {
        await auth.signInWithCredential(authCredential);
        User? user = auth.currentUser;
        if (user != null) {
          BlocProvider.of<OnboardingStageCubit>(context)
              .provideBloc('name', context);
        } else {
          print("Error");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await auth.signInWithCredential(authCredential);
        }
      }
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      print("The phone number entered is invalid!");
    }
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
              height: MediaQuery.of(context).size.height * 0.025,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                  width: MediaQuery.of(context).size.width * 0.725,
                  child: Text(
                    'Enter verification code',
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
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.498,
              height: MediaQuery.of(context).size.height * 0.056,
              child: TextInput(
                  hint: '0 0 0 0 0 0', textInputController: _controller),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.15,
              height: MediaQuery.of(context).size.height * 0.056,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize:
                      Size(getWidth(0.6, context), getHeight(0.05, context)),
                  primary: Color(0xFFFF4D5A),
                  elevation: 3,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  print("verification code = " + _controller.text);
                  BlocProvider.of<AuthenticatorCubit>(context).signInWithPhone(
                      myAuthInfo.getPhoneNumber,
                      _controller.text,
                      'name',
                      context);
                },
                child: Center(
                  child: Text(
                    'Confirm Password',
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

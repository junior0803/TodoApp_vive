import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/ui/onboarding/email_verification_code_screen.dart';
import 'package:vives/ui/onboarding/phone_verification_code_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_button_custom.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class PhoneSignInScreen extends StatefulWidget {
  const PhoneSignInScreen({Key? key}) : super(key: key);

  @override
  _PhoneSignInScreenState createState() => _PhoneSignInScreenState();
}

class _PhoneSignInScreenState extends State<PhoneSignInScreen> {
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
                    'Enter your mobile phone number',
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
                  hint: '(0 0 0) 0 0 0 - 0 0 0 0', textInputController: null),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.15,
              height: MediaQuery.of(context).size.height * 0.056,
              child: RedButton(
                title: 'Send Verification Code',
                toScreen: BlocProvider.of<OnboardingStageCubit>(context)
                            .getStateStage() ==
                        11
                    ? "verificationPhoneSignInCode"
                    : "verificationPhoneSignUpCode",
              ),
            ),
            // Positioned(
            //   left: MediaQuery.of(context).size.width * 0.15,
            //   right: MediaQuery.of(context).size.width * 0.15,
            //   bottom: MediaQuery.of(context).size.height * 0.065,
            //   height: MediaQuery.of(context).size.height * 0.056,
            //   child: TextButtonCustom(title: 'Use Password Instead'),
            // ),
          ],
        ),
      ),
    );
  }
}

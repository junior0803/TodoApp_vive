import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/onboarding/name_screen.dart';
import 'package:vives/ui/onboarding/phone_number_signin_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class PhonePasswordScreen extends StatefulWidget {
  const PhonePasswordScreen({Key? key}) : super(key: key);

  @override
  _PhonePasswordScreenState createState() => _PhonePasswordScreenState();
}

class _PhonePasswordScreenState extends State<PhonePasswordScreen> {
  TextEditingController _controller = TextEditingController();
  AuthenticationInfo authInfo = AuthenticationInfo();

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
                  'Create your password',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Text input for your password
            Positioned(
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.498,
              height: MediaQuery.of(context).size.height * 0.056,
              child: TextInput(
                hint: 'password',
                textInputController: _controller,
                hideText: true,
                textToChange: null,
              ),
            ),
            // Button that takes in your password
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.8,
              height: MediaQuery.of(context).size.height * 0.056,
              child: RedAccountButton(password: _controller.text),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  This button takes in the Onboarding cubit and state in order to redirect you
  to the home screen if authorized by login.
*/
class RedAccountButton extends StatelessWidget {
  final String password;

  RedAccountButton({Key? key, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(getWidth(0.6, context), getHeight(0.05, context)),
        primary: Color(0xFFFF4D5A),
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        // Calls Cubit and creates your account and sends you to your name screen
        BlocProvider.of<OnboardingStageCubit>(context)
            .provideBloc('verificationPhoneSignUpCode', context);
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
    );
  }
}

              // child: RedButton(
              //   title: 'Send Verification Code',
              //   textInput: _controller.text,
              //   infoSetter: authInfo.setPassword,
              //   toScreen: 'name',
              //   // toScreen: (BlocProvider.of<OnboardingStageCubit>(context)
              //   //             .getStateStage() ==
              //   //         3)
              //   //     ? "phoneSignUp"
              //   //     : ((BlocProvider.of<OnboardingStageCubit>(context)
              //   //                 .getStateStage() ==
              //   //             12)
              //   //         ? "home"
              //   //         : "name"),
              // ),
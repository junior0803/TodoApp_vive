import 'package:firebase_auth/firebase_auth.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _IdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthenticationInfo authInfo = AuthenticationInfo();
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
            // Sign In Text
            Positioned(
              left: MediaQuery.of(context).size.width * 0.325,
              right: MediaQuery.of(context).size.width * 0.325,
              top: MediaQuery.of(context).size.height * 0.15,
              child: Text(
                ' Sign In',
                style: TextStyle(
                  fontSize: getWidth(0.09, context),
                ),
              ),
            ),
            // Text Input for your email
            Positioned(
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.398,
              height: MediaQuery.of(context).size.height * 0.056,
              child: TextInput(
                hint: 'your.ID',
                textInputController: _IdController,
                textToChange: null,
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
                textInputController: _passwordController,
                hideText: true,
                textToChange: null,
              ),
            ),
            Positioned(
              left: 50.0,
              right: 51.0,
              top: MediaQuery.of(context).size.height * 0.68,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.756,
                child: Text(
                  isValid ? '' : 'Error missing input field\n'
                      'Password : at least 6 characters.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: isValid ? Colors.black : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Button from bottom of the page
            // TODO: Should only send you to next screen if password there
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.8,
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
                onPressed: () {
                  // Calls the cubit and puts in your information right now it using a fake account
                  // .login(username, password)
                  if (isEmail(_IdController.text)
                      && isPassword(_passwordController.text)) {
                    myAuthInfo.setEmail = _IdController.text;
                    myAuthInfo.setPassword = _passwordController.text;
                    changeValidState(true);
                    BlocProvider.of<AuthenticatorCubit>(context)
                        .login(myAuthInfo.getEmail, myAuthInfo.getPassword, context);
                  } else if(isPhoneNumber(_IdController.text)
                      && isPassword(_passwordController.text)) {
                    myAuthInfo.setPhoneNumber = _IdController.text;
                    myAuthInfo.setPassword = _IdController.text;
                    changeValidState(true);
                    BlocProvider.of<AuthenticatorCubit>(context)
                        .signInWithPhone(myAuthInfo.getPhoneNumber, myAuthInfo.getPassword, 'home', context);
                  } else {
                    changeValidState(false);
                    return;
                  }
                  //Junior mush patch begin
                  // BlocProvider.of<OnboardingStageCubit>(context)
                  //     .provideBloc('home', context);
                  //Junior mush patch end
                },
                child: Center(
                  child: Text(
                    'Sign In',
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
              )
            ),
          ],
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
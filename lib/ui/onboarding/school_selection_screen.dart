import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/column_choice_chips_builder.dart';
import 'package:vives/ui/widgets/email_text.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';
import 'package:vives/ui/widgets/white_button.dart';

class SchoolSelectorScreen extends StatefulWidget {
  const SchoolSelectorScreen({Key? key}) : super(key: key);
  @override
  _SchoolSelectorScreenState createState() => _SchoolSelectorScreenState();
}

class _SchoolSelectorScreenState extends State<SchoolSelectorScreen> {
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _CodeController = TextEditingController();
  TextEditingController _phoneCodeController = TextEditingController();

  Future registerPhoneNumber(String phoneNumber, BuildContext context) async {
    // FirebaseAuth _auth = FirebaseAuth.instance;

    auth.verifyPhoneNumber(
      phoneNumber: '+1 512 123 1234',
      timeout: Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          // TODO: This must be added to a bloc state
          print('The provided phone number is not valid.');
        } else {
          print('Error:  $e');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Give the code?"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _phoneCodeController,
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () async {
                    AuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: _phoneCodeController.text.trim(),
                    );
                    final result = await auth.signInWithCredential(credential);
                    final user = result.user;
                    if (user != null) {
                      print("USER");
                      print(user.uid.toString());
                      print(result.toString());
                      Navigator.of(context).pop();
                      BlocProvider.of<OnboardingStageCubit>(context)
                          .provideBloc('name', context);
                      // BlocProvider.of<OnboardingStageCubit>(context)
                      //     .provideBloc('name', context);
                    }
                  },
                ),
              ],
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  bool isValid = true;

  changeValidState(bool state) {
    print("~~~~~~~~~~" + state.toString());
    setState(() {
      isValid = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<OnboardingStageCubit, OnboardingStageState>(
        builder: (context, state) {
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
                  // Heading text for the page
                  Positioned(
                    left: 50.0,
                    right: 51.0,
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.756,
                      child: Text(
                        'Choose your school',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // This is composed of different selectable chips imported from ColumnChoiceChips
                  Positioned(
                    left: 57.0,
                    right: 57.0,
                    top: MediaQuery.of(context).size.height * 0.182,
                    child: ColumnChoiceChips(),
                  ),
                  // Text Input for your email

                  state.selectedValue == "@utexas.edu"
                      ? Positioned(
                    left: 50.0,
                    right: 148.0,
                    top: MediaQuery.of(context).size.height * 0.53,
                    height: MediaQuery.of(context).size.height * 0.056,
                    child: TextInput(
                      hint: 'your.email',
                      textInputController: _EmailController,
                    ),
                  )
                      : Container(),

                  state.selectedValue == "code"
                      ? Stack(children: [
                    Positioned(
                      left: 50.0,
                      right: 50.0,
                      top: MediaQuery.of(context).size.height * 0.48,
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: TextInput(
                        hint: '(0 0 0) 0 0 0 - 0 0 0 0',
                        textInputController: _PhoneController,
                      ),
                    ),
                    Positioned(
                      left: 80.0,
                      right: 80.0,
                      top: MediaQuery.of(context).size.height * 0.58,
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: TextInput(
                        hint: 'Code',
                        textInputController: _CodeController,
                      ),
                    )
                  ])
                      : Container(),
                  // Text Input for your email
                  state.selectedValue == "other"
                      ? Positioned(
                    left: 50.0,
                    right: 50.0,
                    top: MediaQuery.of(context).size.height * 0.53,
                    height: MediaQuery.of(context).size.height * 0.056,
                    child: TextInput(
                      hint: '(0 0 0) 0 0 0 - 0 0 0 0',
                      textInputController: _PhoneController,
                    ),
                  )
                      : Container(),
                  // This reads the state and the email choice changes
                  Positioned(
                    right: MediaQuery.of(context).size.height * 0.035,
                    top: MediaQuery.of(context).size.height * 0.545,
                    height: MediaQuery.of(context).size.height * 0.022,
                    child: EmailCode(title:state.selectedValue == "@utexas.edu" ? '@utexas.edu' : ""),
                  ),
                  Positioned(
                    left: 50.0,
                    right: 51.0,
                    top: MediaQuery.of(context).size.height * 0.7,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.756,
                      child: Text(
                          isValid ? '' : 'Error missing input field',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.0,
                          color:
                          isValid && state.selectedValue != null ? Colors.black : Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       CollectionReference users =
                  //           FirebaseFirestore.instance.collection('users');
                  //       users.doc('test').set({
                  //         'test': 'test',
                  //       });
                  //     },
                  //     child: Text('Test'),
                  //   ),
                  // ),
                  // Local button
                  // TODO: Should only send you to next screen if email has been set
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    top: MediaQuery.of(context).size.height * 0.8,
                    height: MediaQuery.of(context).size.height * 0.056,
                    child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(
                                getWidth(0.6, context), getHeight(0.05, context)),
                            primary: Color(0xFFFF4D5A),
                            elevation: 3,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            print(state.selectedValue.toString());
                            switch(state.selectedValue) {
                              case "@utexas.edu":
                                myAuthInfo.setEmail =
                                    _EmailController.text + "@gmail.com";
                                if (isEmail(myAuthInfo.getEmail)) {
                                  changeValidState(true);
                                  BlocProvider.of<OnboardingStageCubit>(context)
                                      .provideBloc('passwordEmailAccount', context);
                                } else changeValidState(false);
                                break;
                              case 'code':
                                print('Other');
                                myAuthInfo.setPhoneNumber = _PhoneController.text;
                                final phoneNumber = _PhoneController.text.trim();
                                registerPhoneNumber(
                                    '+1 512 123 1234'.trim(), context);

                                if (isPhoneNumber(myAuthInfo.getPhoneNumber)) {
                                  changeValidState(true);
                                  // BlocProvider.of<OnboardingStageCubit>(context)
                                  //     .provideBloc(
                                  //
                                } else changeValidState(false);
                                break;
                              case 'other':
                                print('Other');
                                myAuthInfo.setPhoneNumber = _PhoneController.text;
                                final phoneNumber = _PhoneController.text.trim();
                                registerPhoneNumber(
                                    '+1 512 123 1234'.trim(), context);

                                if (isPhoneNumber(myAuthInfo.getPhoneNumber)) {
                                  changeValidState(true);
                                  // BlocProvider.of<OnboardingStageCubit>(context)
                                  //     .provideBloc(
                                  //
                                } else changeValidState(false);
                                break;
                              default:
                                changeValidState(false);
                            }
                          },
                          child: Center(
                            child: Text(
                              'Send Verification Code',
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
        });
  }
}

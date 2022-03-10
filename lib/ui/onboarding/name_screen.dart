import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/onboarding/profile_picture_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

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
            // Header text
            Positioned(
              left: 49.0,
              right: 58.0,
              top: 110.0,
              height: 70.0,
              child: Container(
                height: 70.000,
                width: MediaQuery.of(context).size.width * 0.742,
                child: Text(
                  'What is your name?',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // First name text input
            Positioned(
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.279,
              height: MediaQuery.of(context).size.height * 0.056,
              child: TextInput(
                hint: 'First Name',
                textInputController: _firstNameController,
              ),
            ),
            // Last name text input
            Positioned(
              left: 57.0,
              right: 57.0,
              top: MediaQuery.of(context).size.height * 0.419,
              height: MediaQuery.of(context).size.height * 0.056,
              child: TextInput(
                hint: 'Last Name',
                textInputController: _lastNameController,
              ),
            ),
            Positioned(
              left: 50.0,
              right: 51.0,
              top: MediaQuery.of(context).size.height * 0.68,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.756,
                child: Text(
                  isValid ? '' : 'Error missing input field',
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
            // Takes in your first and last name to use when submitting
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
                  // Sets first and last name to info class
                  if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty){
                    changeValidState(false);
                    return;
                  } else
                    changeValidState(true);
                  myProfileInfo.setFirstName = _firstNameController.text;
                  myProfileInfo.setLastName = _lastNameController.text;
                  print("firstName = " + myProfileInfo.getFirstName
                      + " lastName = " + myProfileInfo.getLastName);
                  // Takes you to the next page profile pic
                  BlocProvider.of<OnboardingStageCubit>(context)
                      .provideBloc("profilePic", context);
                },
                child: Center(
                  child: Text(
                    'Next',
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

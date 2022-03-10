import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/onboarding/interest_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/column_choice_chips_year_builder.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/white_button.dart';

class YearSelectionScreen extends StatefulWidget {
  const YearSelectionScreen({Key? key}) : super(key: key);

  @override
  _YearSelectionScreenState createState() => _YearSelectionScreenState();
}

class _YearSelectionScreenState extends State<YearSelectionScreen> {

  int YearSelectionFlag = -1;
  bool YearSelected = true;

  setYearSelectionState(){
    bool flag = true;
    if (YearSelectionFlag == -1){
      flag =  false;
    }
    setState(() {
      YearSelected = flag;
    });
  }

  changeYearSelectState(int state) {
    print("~~~~~~~~~~" + state.toString());
    setState(() {
      YearSelectionFlag = state;
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
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: 90.0,
              height: 32.0,
              child: Container(
                height: 32.000,
                width: MediaQuery.of(context).size.width * 0.756,
                child: Text(
                  'What Year Are You?',
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
            // Column on chips to be selected of what year you are
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.233,
              child: YearColumnChoiceChips(
                callback: changeYearSelectState,
              ),
            ),
            Positioned(
              left: 50.0,
              right: 51.0,
              top: MediaQuery.of(context).size.height * 0.68,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.756,
                child: Text(
                  YearSelected ? '': 'Please select Year',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ),
            // Sends you to the next screen
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
                onPressed: () {
                  setYearSelectionState();
                  // Sets School Selection class
                  if (YearSelected) {
                    // Takes you to the next page profile pic
                    BlocProvider.of<OnboardingStageCubit>(context)
                        .provideBloc("interest", context);
                  }
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


    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Stack(children: [
          
    //     ],),
    //   ),
    // );

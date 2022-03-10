import 'package:flutter/material.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/onboarding/preference_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/selected_wrap_chips_builder.dart';
import 'package:vives/ui/widgets/wrap_choice_chips_builder.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> interestList = [
    "Volunteering",
    "Writing",
    "Blogging",
    "Podcasting",
    "Marketing",
    "Photography",
    "Travel",
    "Art",
    "Yoga",
    "Music",
    "Festivals"
  ];
  List<String> selectedInterestList = [];

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
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: 90.0,
              child: Text(
                'What are your interests?',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: 133.0,
              child: Text(
                'Select 5',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Renders selected chips with a max of 5
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: 150.0,
              child: WrapSelectedChips(
                selectedList: selectedInterestList,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.374,
              child: Text(
                'Categories',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Renders selectable chips with a max of 5
            Positioned(
              left: MediaQuery.of(context).size.width * 0.125,
              right: MediaQuery.of(context).size.width * 0.125,
              top: MediaQuery.of(context).size.height * 0.41,
              child: WrapChoiceChips(
                reportList: interestList,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedInterestList = selectedList;
                  });
                },
              ),
            ),
            // TODO: Should only show interest tags have been selected
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.15,
              height: MediaQuery.of(context).size.height * 0.056,
              child: RedButton(
                title: 'Next',
                toScreen: selectedInterestList.length < 5 ? "": "preference",
                infoSetter: myProfileInfo,
                interestTags: selectedInterestList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

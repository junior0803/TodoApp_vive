import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/map/filter_screen.dart';
import 'package:vives/ui/tabs/multiple/experience_info_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/experience_card.dart';
import 'package:vives/ui/widgets/invite_field.dart';
import 'package:vives/ui/widgets/map_red_buttons.dart';
import 'package:vives/ui/widgets/previous_upcoming_buttons.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class MyExperiencesScreen extends StatefulWidget {
  const MyExperiencesScreen({Key? key}) : super(key: key);

  @override
  _MyExperiencesScreenState createState() => _MyExperiencesScreenState();
}

class _MyExperiencesScreenState extends State<MyExperiencesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Experiences',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                PreviousUpcomingButton(),
                Column(
                  children: [
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      myExperience: true,
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                        myUpcomingExperience: true,
                      ),
                    ),
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      myExperience: true,
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                        myUpcomingExperience: true,
                      ),
                    ),
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      myExperience: true,
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                        myUpcomingExperience: true,
                      ),
                    ),
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      myExperience: true,
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                        myUpcomingExperience: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

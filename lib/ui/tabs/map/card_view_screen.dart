import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/map/filter_screen.dart';
import 'package:vives/ui/tabs/multiple/experience_info_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/experience_card.dart';
import 'package:vives/ui/widgets/invite_field.dart';
import 'package:vives/ui/widgets/map_red_buttons.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class CardViewScreen extends StatefulWidget {
  const CardViewScreen({Key? key}) : super(key: key);

  @override
  _CardViewScreenState createState() => _CardViewScreenState();
}

class _CardViewScreenState extends State<CardViewScreen> {
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
            // Experience in card view rather than markers on a map
            /*
              TODO: Render each experience/hangout from the database
            */
            ListView(
              children: [
                SizedBox(height: getHeight(0.01, context)),
                Column(
                  children: [
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      // When pushed the screen to go to
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                      ),
                    ),
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                      ),
                    ),
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                      ),
                    ),
                    ExperienceCard(
                      profilePicture: 'assets/201_855.png',
                      name: 'Canoeing',
                      location: 'Siargao Island',
                      toScreen: ExperienceInfoScreen(
                        experienceName: 'Canoeing',
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.075,
              right: MediaQuery.of(context).size.width * 0.1,
              child: MapRedButton(
                chosenIcon: Icons.filter_alt,
                title: 'Filter',
                toScreen: FilterScreen(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

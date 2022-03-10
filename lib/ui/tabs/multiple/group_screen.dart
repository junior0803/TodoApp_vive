import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/multiple/experience_info_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/description_bubble.dart';
import 'package:vives/ui/widgets/experience_card.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/previous_upcoming_buttons.dart';

class GroupScreen extends StatefulWidget {
  final String groupName;
  final bool? myGroup;
  const GroupScreen({Key? key, required this.groupName, this.myGroup})
      : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.groupName,
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        body: Padding(
          padding: EdgeInsets.all(getWidth(0.05, context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getWidth(0.6, context),
                  width: getWidth(0.6, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Image.asset(
                    'assets/201_855.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: getHeight(0.015, context)),
                DescriptionBubble(
                  description:
                      'Descriptive Text is a text which says what a person or a thing is like. Its purpose is to describe and reveal a particular person, place, or thing. In a broad sense, description, as explained by Kane (2000: 352), is defined like in the following sentence:',
                ),
                SizedBox(height: getHeight(0.015, context)),
                if (widget.myGroup == null)
                  RedButton(
                    title: 'Request To Join',
                    buttonFunction: true,
                  ),
                if (widget.myGroup == true)
                  Column(
                    children: [
                      PreviousUpcomingButton(),
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
                  ),
              ],
            ),

            // Positioned(
            //   left: MediaQuery.of(context).size.width * 0.15,
            //   right: MediaQuery.of(context).size.width * 0.15,
            //   bottom: MediaQuery.of(context).size.height * 0.05,
            //   height: MediaQuery.of(context).size.height * 0.056,
            //   child: RedButton(
            //     title: 'Request To Join',
            //     buttonFunction: true,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/multiple/invite_screen.dart';
import 'package:vives/ui/widgets/alert_dialog.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/experience_image_holder.dart';
import 'package:vives/ui/widgets/description_bubble.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/location_address_info_bubble.dart';
import 'package:vives/ui/widgets/small_red_button.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/widgets/time_info_bubble.dart';

// The experience screen when one is selected with all the info needed
// TODO: Get the info for the experience screen

class ExperienceInfoScreen extends StatefulWidget {
  final String experienceName;
  final bool? myUpcomingExperience;
  const ExperienceInfoScreen(
      {Key? key, required this.experienceName, this.myUpcomingExperience})
      : super(key: key);

  @override
  _ExperienceInfoScreenState createState() => _ExperienceInfoScreenState();
}

class _ExperienceInfoScreenState extends State<ExperienceInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.experienceName,
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        // body: Text(
        //   'TEST',
        //   style: TextStyle(color: Colors.black),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: getHeight(0.015, context)),
              // The image of the experience
              // TODO: Get the image from the selected experience
              ExperienceImageHolder(),
              Padding(
                padding: EdgeInsets.all(getWidth(0.025, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // The join experience button
                    // TODO: show on database you joined and record history if you actually went
                    ElevatedButton(
                      onPressed: () {
                        showAlertDialog(context, 'Join Experience Name');
                      },
                      child: SizedBox(
                        width: getWidth(0.35, context),
                        child: Center(
                          child: Text(
                            'Join',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFF4D5A),
                        minimumSize: Size(
                            getWidth(0.45, context), getHeight(0.05, context)),
                        elevation: 3,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    // This is the invite button that redirects you to your friends/connections
                    SmallRedButton(
                      title: 'Invite +',
                      toScreen: InviteScreen(),
                    ),
                  ],
                ),
              ),
              // This has the experience info like start date & time, location, and description
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeBubble(
                    date: 'DATE',
                    time: 'TIME',
                  ),
                  SizedBox(height: getHeight(0.015, context)),
                  LocationAddressBubble(
                    location: 'Location',
                    address: 'Del Carmen , Surigao del Norte, Phillipines',
                    myUpcomingExperience: widget.myUpcomingExperience,
                  ),
                  SizedBox(height: getHeight(0.015, context)),
                  DescriptionBubble(
                    description:
                        'Descriptive Text is a text which says what a person or a thing is like. Its purpose is to describe and reveal a particular person, place, or thing. In a broad sense, description, as explained by Kane (2000: 352), is defined like in the following sentence:',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Show AlertDialog
showAlertDialog(BuildContext context, title) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: Text(title),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    actionsAlignment: MainAxisAlignment.spaceAround,
    actions: [
      TextButton(
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {},
      ),
      ElevatedButton(
        child: Text("Confirm"),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          minimumSize: Size(getWidth(0.15, context), getHeight(0.05, context)),
          elevation: 3,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ],
  );

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}
// Positioned(
//   left: MediaQuery.of(context).size.width * 0.045,
//   right: MediaQuery.of(context).size.width * 0.045,
//   top: MediaQuery.of(context).size.height * 0.025,
//   height: MediaQuery.of(context).size.height * 0.45,
//   child: ExperienceImageHolder(),
// ),
// Positioned(
//   left: MediaQuery.of(context).size.width * 0.035,
//   width: MediaQuery.of(context).size.width * 0.455,
//   top: MediaQuery.of(context).size.height * 0.5,
//   child: RedButton(
//     title: 'Join',
//   ),
// ),
// Positioned(
//   left: MediaQuery.of(context).size.width * 0.515,
//   width: MediaQuery.of(context).size.width * 0.455,
//   top: MediaQuery.of(context).size.height * 0.5,
//   child: RedButton(
//     title: 'Invite +',
//   ),
// ),
// Positioned(
//   left: MediaQuery.of(context).size.width * 0.045,
//   right: MediaQuery.of(context).size.width * 0.045,
//   top: MediaQuery.of(context).size.height * 0.575,
//   height: MediaQuery.of(context).size.height * 0.075,
//   child: InfoBubble(),
// ),
// Positioned(
//   left: MediaQuery.of(context).size.width * 0.045,
//   right: MediaQuery.of(context).size.width * 0.045,
//   top: MediaQuery.of(context).size.height * 0.675,
//   height: MediaQuery.of(context).size.height * 0.075,
//   child: InfoBubble(),
// ),
// Positioned(
//   left: MediaQuery.of(context).size.width * 0.045,
//   right: MediaQuery.of(context).size.width * 0.045,
//   top: MediaQuery.of(context).size.height * 0.775,
//   height: MediaQuery.of(context).size.height * 0.15,
//   child: InfoBubble(),
// ),

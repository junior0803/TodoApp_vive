import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/models/onboarding_info.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RedButton extends StatelessWidget {
  final String title;
  final toScreen;
  final buttonFunction;
  final String? textInput;
  final infoSetter;
  final bool? profileComplete;
  final bool? uploadImage;
  final List<String>? interestTags;
  final List<String>? preferenceTags;

  const RedButton({
    Key? key,
    required this.title,
    this.toScreen,
    this.buttonFunction,
    this.textInput,
    this.infoSetter,
    this.uploadImage,
    this.interestTags,
    this.preferenceTags,
    this.profileComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> createUserProfile() async {
      // final auth = FirebaseAuth.instance;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(auth.currentUser!.uid).set({
        'first_name': myProfileInfo.getFirstName,
        'last_name': myProfileInfo.getLastName,
        'year': myProfileInfo.getYear,
        'profileSource': myProfileInfo.getFirestoreProfileSource,
        'interests': myProfileInfo.getInterestTags,
        'preferences': preferenceTags,
      });
    }

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
      onPressed: () async {
        if (toScreen != null) {
          if (toScreen is String) {
            BlocProvider.of<OnboardingStageCubit>(context)
                .provideBloc(toScreen, context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => toScreen,
              ),
            );
          }
        }
        print(profileComplete);
        if (profileComplete == true) {
          createUserProfile();
          print('ProfileInfo' + myProfileInfo.getProfileComplete.toString());
          BlocProvider.of<AuthenticatorCubit>(context).completeProfile(auth.currentUser);
        }

        if (buttonFunction != null && uploadImage == true) {
          buttonFunction();
        }
        // if (buttonFunction != null) {
        //   showAlertDialog(context, 'Join Experience Name');
        // }
        if (buttonFunction != null) {
          buttonFunction();
        }
        if (textInput != null) {
          infoSetter.setEmail = textInput;
        }

        if (interestTags != null) {
          infoSetter.setInterestTags = interestTags;
          print('INTEREST TAGS');
          print(myProfileInfo.getInterestTags);
        }
      },
      child: Center(
        child: Text(
          '${this.title}',
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

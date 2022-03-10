import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:vives/ui/onboarding/year_selection_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/picture_selector_button.dart';
import 'package:vives/ui/widgets/profile_picture_holder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vives/models/onboarding_info.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({Key? key}) : super(key: key);

  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  /* 
    This connects you to the firestore storage, puts your files in there and
    then downloads it and gives you the link for future use
  */
  Future<void> _putAndDownloadImage() async {
    if (myProfileInfo.profileSource != null) {
      print('To Download-------------');
      firebase_storage.TaskSnapshot snapshot = await firebase_storage
          .FirebaseStorage.instance
          .ref(auth.currentUser!.uid)
          .child('image/image.png')
          .putFile(File(myProfileInfo.profileSource.path));
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      myProfileInfo.setFirestoreProfileSource = downloadUrl;
      print(myProfileInfo.getFirestoreProfileSource);
    }
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
              left: 50.0,
              right: 51.0,
              top: MediaQuery.of(context).size.height * 0.123,
              height: MediaQuery.of(context).size.height * 0.036,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.036,
                  width: MediaQuery.of(context).size.width * 0.756,
                  child: Text(
                    'Profile Picture',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ),
            // Profile picture holder
            // Contains TODO
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.19,
              child: ProfilePictureHolder(),
            ),
            // Button for camera
            Positioned(
              left: MediaQuery.of(context).size.width * 0.2,
              top: MediaQuery.of(context).size.height * 0.450,
              child: PictureSelector(
                chosenIcon: Icons.camera_enhance,
                selectedType: ImageSource.camera,
              ),
            ),
            // Button for gallery image selector
            Positioned(
              right: MediaQuery.of(context).size.width * 0.2,
              top: MediaQuery.of(context).size.height * 0.450,
              child: PictureSelector(
                chosenIcon: Icons.image,
                selectedType: ImageSource.gallery,
              ),
            ),
            /*
              This downloads the image and gives you the url for later use
              It also sends you to the next screen
              TODO: Should only send you to next screen if profile picture has
                been selected.
            */
            Positioned(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.8,
              height: MediaQuery.of(context).size.height * 0.056,
              child: RedButton(
                title: 'Next',
                toScreen: "yearSelection",
                uploadImage: true,
                buttonFunction: _putAndDownloadImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _setImageView(context) {
//   if (myProfileInfo.profileSource != null) {
//     return Image.file(
//       File(myProfileInfo.profileSource.path),
//       fit: BoxFit.fill,
//     );
//   } else {
//     return Icon(
//       Icons.person_outline_rounded,
//       size: MediaQuery.of(context).size.width * 0.6,
//     );
//   }
// }

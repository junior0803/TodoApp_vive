import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/experience_post_info.dart';
import 'package:vives/ui/widgets/experience_image_holder.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';
import 'package:vives/ui/widgets/white_button.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:intl/intl.dart';

import 'dart:io';

/* 
  TODO: 
    - Need to format date and time.
    - Must add photo selector
*/

class CreationSectionThree extends StatefulWidget {
  const CreationSectionThree({Key? key}) : super(key: key);

  @override
  _CreationSectionThreeState createState() => _CreationSectionThreeState();
}

class _CreationSectionThreeState extends State<CreationSectionThree> {
  late DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  // late String? _chosenDate = null;
  // late String? _chosenTime = null;
  late DateTime? _chosenDate = null;
  late DateTime? _chosenTime = null;
  // late dynamic _firestoreSource = null;
  // TextEditingController _dateController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // Future<void> _putAndDownloadImage(startDate, startTime) async {
  //   if (experiencePostInfo.getExperiencePhoto != null) {
  //     print('To Download-------------');
  //     firebase_storage.TaskSnapshot snapshot = await firebase_storage
  //         .FirebaseStorage.instance
  //         .ref()
  //         .child('image/image.png')
  //         .putFile(File(experiencePostInfo.getExperiencePhoto.path));
  //     final String downloadUrl = await snapshot.ref.getDownloadURL();
  //     // experiencePostInfo.setFirestoreSource = downloadUrl;
  //     // _firestoreSource = downloadUrl;
  //     print(downloadUrl);
  //     // createExperience(downloadUrl, startDate, startTime);
  //   }
  //   createExperience('downloadUrl', startDate, startTime);
  // }

  Future<void> createExperience(description, startDate, startTime) async {
    CollectionReference experiences =
        FirebaseFirestore.instance.collection('experiences');
    await experiences.add({
      'group': experiencePostInfo.getGroup,
      'experienceName': experiencePostInfo.getExperienceName,
      'exclusivity': experiencePostInfo.getExclusivity,
      'category': experiencePostInfo.getCategory,
      'location': [
        experiencePostInfo.getExperienceLocation.latitude,
        experiencePostInfo.getExperienceLocation.longitude
      ],
      'photo': null,
      'description': description,
      'startDate': startDate.toString(),
      'startTime': startTime.toString(),
    });
  }

  _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      setState(() => _chosenDate = pickedDate);
    } else {
      print("Date is not selected");
    }
  }

  _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _chosenTime =
            DateTime(2021, 12, 12, selectedTime.hour, selectedTime.minute);
      });
  }

  selectDate(selection) {
    setState(() => _chosenDate = selection);
    print(_chosenDate);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   top: MediaQuery.of(context).size.height * 0.125,
        //   left: getWidth(0.225, context),
        //   right: getWidth(0.225, context),
        //   height: getWidth(0.55, context),
        //   child: ExperienceImageHolder(),
        // ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.125,
          left: getWidth(0.225, context),
          right: getWidth(0.225, context),
          height: getWidth(0.55, context),
          child: TextInput(
            hint: 'Description',
            textInputController: _descriptionController,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.25,
          left: MediaQuery.of(context).size.width * 0.125,
          right: MediaQuery.of(context).size.width * 0.125,
          child: Container(
            width: getWidth(0.1, context),
            height: getHeight(0.05, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Date:',
                  style: TextStyle(
                      fontSize: getWidth(0.05, context),
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    _selectDate();
                  },
                  child: Text(
                    _chosenDate == null
                        ? 'Select Date'
                        : DateFormat('MMMMEEEEd').format(_chosenDate!),
                    // : '${_chosenDate.toString()}',
                    style: TextStyle(
                      fontSize: getWidth(0.04, context),
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.175,
          left: MediaQuery.of(context).size.width * 0.125,
          right: MediaQuery.of(context).size.width * 0.125,
          child: Container(
            width: getWidth(0.1, context),
            height: getHeight(0.05, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Time:',
                  style: TextStyle(
                    fontSize: getWidth(0.05, context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _selectTime();
                  },
                  child: Text(
                    _chosenTime == null
                        ? 'Select Time'
                        // : '${_chosenTime.toString()}',
                        // : DateFormat('jmz').format(_chosenTime!),
                        : DateFormat('hh:mm aa').format(_chosenTime!),
                    style: TextStyle(
                      fontSize: getWidth(0.04, context),
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.075,
          left: MediaQuery.of(context).size.width * 0.3,
          right: MediaQuery.of(context).size.width * 0.3,
          child: RedButton(
            title: "Post",
            buttonFunction: () {
              BlocProvider.of<ExperiencePostCubit>(context).toMapHome();
              // _putAndDownloadImage(_chosenDate, _chosenTime);
              createExperience(
                _descriptionController.text,
                _chosenDate,
                _chosenTime,
              );
            },
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.025,
          left: MediaQuery.of(context).size.width * 0.4,
          right: MediaQuery.of(context).size.width * 0.4,
          child: TextButton(
            onPressed: () {
              BlocProvider.of<ExperiencePostCubit>(context).toSection2();
            },
            child: Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

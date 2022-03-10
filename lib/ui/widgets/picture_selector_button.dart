import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vives/models/onboarding_info.dart';

/*
  TODO: 
    Add IOS dependancies and reasons why you will be using it
    Get file path? for firestorage
*/

class PictureSelector extends StatefulWidget {
  final chosenIcon;
  final selectedType;
  const PictureSelector({
    Key? key,
    required this.chosenIcon,
    this.selectedType,
  }) : super(key: key);

  @override
  _PictureSelectorState createState() => _PictureSelectorState();
}

class _PictureSelectorState extends State<PictureSelector> {
  XFile? _profilePicturePath;
  dynamic _pickImageError;
  var _picker;

  @override
  void initState() {
    super.initState();
    _picker = new ImagePicker();
  }

  _getImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: widget.selectedType,
        preferredCameraDevice: CameraDevice.front,
      );
      setState(() {
        _profilePicturePath = pickedFile;
        myProfileInfo.setProfileSource = pickedFile;
        BlocProvider.of<OnboardingStageCubit>(context)
            .selectImage(_profilePicturePath!.path, context);
      });
    } catch (e) {
      print('Error');
      setState(() {
        _pickImageError = e;
      });
    }
    print("PATH: $_profilePicturePath");
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFF4D5A),
        shape: CircleBorder(),
      ),
      onPressed: () {
        _getImage();
      },
      child: Padding(
          padding: EdgeInsets.all(getWidth(0.03, context)),
          child: Center(
            child: Icon(
              widget.chosenIcon,
              size: 35,
              color: Colors.white,
            ),
          )),
    );
  }
}

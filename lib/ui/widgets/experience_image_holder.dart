import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/experience_post_info.dart';

class ExperienceImageHolder extends StatefulWidget {
  const ExperienceImageHolder({Key? key}) : super(key: key);

  @override
  _ExperienceImageHolderState createState() => _ExperienceImageHolderState();
}

class _ExperienceImageHolderState extends State<ExperienceImageHolder> {
  XFile? _experiencePhoto;
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
        // This will be gallery but camera for testing purposes
        source: ImageSource.camera,
      );
      setState(() {
        _experiencePhoto = pickedFile;
        experiencePostInfo.setExperiencePhoto = _experiencePhoto;
        BlocProvider.of<ExperiencePostCubit>(context)
            .setExperiencePicture(_experiencePhoto!.path);
      });
    } catch (e) {
      print('Error');
      setState(() {
        _pickImageError = e;
      });
    }
    print("PATH: $_experiencePhoto");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: getWidth(0.95, context),
        width: getWidth(0.95, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: BlocBuilder<ExperiencePostCubit, ExperiencePostState>(
          builder: (context, state) {
            if (state.experiencePhotoPath != null) {
              return Image.file(
                File(state.experiencePhotoPath),
                fit: BoxFit.fill,
              );
            }
            return Icon(
              Icons.person_outline_rounded,
              size: MediaQuery.of(context).size.width * 0.4,
            );
          },
        ),
      ),
      onTap: () {
        _getImage();
      },
    );
  }
}

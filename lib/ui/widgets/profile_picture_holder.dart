import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/onboarding_info.dart';
import 'dart:io';

class ProfilePictureHolder extends StatefulWidget {
  const ProfilePictureHolder({Key? key}) : super(key: key);

  @override
  _ProfilePictureHolderState createState() => _ProfilePictureHolderState();
}

class _ProfilePictureHolderState extends State<ProfilePictureHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(0.325, context),
      width: getWidth(0.8, context),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 3.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      // Listens to the state for a selected picture and shows if selected or not
      child: BlocBuilder<OnboardingStageCubit, OnboardingStageState>(
        builder: (context, state) {

          if (state.selectedImagePath != null) {
            // TODO: Make image fill as the circle of the container
            return Container(
              height: getHeight(0.325, context),
              width: getWidth(0.8, context),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(
                      File(state.selectedImagePath),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
            //   Image.file(
            //   File(state.selectedImagePath),
            //   fit: BoxFit.fill,
            // );
          }
          return Icon(
            Icons.person_outline_rounded,
            size: MediaQuery.of(context).size.width * 0.6,
          );
        },
      ),
    );
  }
}

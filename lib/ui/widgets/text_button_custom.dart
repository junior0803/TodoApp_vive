import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';

class TextButtonCustom extends StatelessWidget {
  final String title;
  final toScreen;
  final buttonFunction;
  const TextButtonCustom({
    Key? key,
    required this.title,
    this.toScreen,
    this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      onPressed: () {
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
      },
    );
  }
}

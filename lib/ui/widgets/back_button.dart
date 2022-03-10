import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';

class BackButtonCustom extends StatelessWidget {
  static var uiGroup = "";
  const BackButtonCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        switch (uiGroup) {
          case "onboarding":
            BlocProvider.of<OnboardingStageCubit>(context)
                .backtrackStageValue();
            break;
        }
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: 25,
        color: Colors.black,
      ),
    );
  }
}

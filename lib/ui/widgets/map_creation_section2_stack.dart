import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/experience_post_info.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class CreationSectionTwo extends StatefulWidget {
  const CreationSectionTwo({Key? key}) : super(key: key);

  @override
  _CreationSectionTwoState createState() => _CreationSectionTwoState();
}

class _CreationSectionTwoState extends State<CreationSectionTwo> {
  void setSectionTwoData(location) {
    print('$location');
    experiencePostInfo.setExperienceLocation = location;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: getHeight(0.15, context),
            ),
            TextInput(hint: 'Search', textInputController: null),
            SizedBox(
              height: getHeight(0.025, context),
            ),
            Text(
              'or Press and Hold To Pin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.075,
          left: MediaQuery.of(context).size.width * 0.3,
          right: MediaQuery.of(context).size.width * 0.3,
          child: RedButton(
            title: 'Next',
            buttonFunction: () {
              BlocProvider.of<ExperiencePostCubit>(context).toSection3();
            },
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.025,
          left: MediaQuery.of(context).size.width * 0.4,
          right: MediaQuery.of(context).size.width * 0.4,
          child: TextButton(
            onPressed: () {
              BlocProvider.of<ExperiencePostCubit>(context).toSection1();
            },
            child: Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
    // return Stack(
    //   children: [
    //     Positioned(
    //       top: MediaQuery.of(context).size.height * 0.125,
    //       left: MediaQuery.of(context).size.width * 0.2,
    //       right: MediaQuery.of(context).size.width * 0.2,
    //       child: TextInput(hint: 'Search'),
    //     ),
    //     Positioned(
    //       top: MediaQuery.of(context).size.height * 0.125,
    //       left: MediaQuery.of(context).size.width * 0.2,
    //       right: MediaQuery.of(context).size.width * 0.2,
    //       child: Text('or Press and Hold To Pin'),
    //     ),
    //   ],
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/onboarding_info.dart';

class YearColumnChoiceChips extends StatefulWidget {
  final Function callback;
  const YearColumnChoiceChips({Key? key, required this.callback})
      : super(key: key);

  @override
  _YearColumnChoiceChipsState createState() => _YearColumnChoiceChipsState();
}

class _YearColumnChoiceChipsState extends State<YearColumnChoiceChips> {
  int _selectedOption = -1;
  List<String> _chipOption = [
    'Freshman',
    'Sophmore',
    'Junior',
    'Senior',
    'Other',
  ];

  Widget _buildChips(context) {
    List<Widget> chips = [];
    for (int i = 0; i < _chipOption.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        label: Container(
          height: getHeight(0.05, context),
          // width: getWidth(0.9, context),
          child: Center(
            child: Text(
              _chipOption[i],
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        selected: _selectedOption == i,
        backgroundColor: Colors.white,
        selectedColor: Colors.green,
        onSelected: (bool selected) {
          // BlocProvider.of<OnboardingStageCubit>(context)
          //     .selectSchool("${_chipValueOption[i]}", context);
          widget.callback(i);
          setState(() {
            if (selected) {
              _selectedOption = i;
              myProfileInfo.setYear = _chipOption[i];
              print(_chipOption[i]);
              print(myProfileInfo.getYear);
            }
          });
        },
      );

      chips.add(Padding(
        padding: EdgeInsets.all(getWidth(0.015, context)),
        child: choiceChip,
      ));
    }

    return Column(
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChips(context);
  }
}

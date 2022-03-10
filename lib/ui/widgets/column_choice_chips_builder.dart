import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';

class ColumnChoiceChips extends StatefulWidget {
  const ColumnChoiceChips({Key? key}) : super(key: key);

  @override
  _ColumnChoiceChipsState createState() => _ColumnChoiceChipsState();
}

class _ColumnChoiceChipsState extends State<ColumnChoiceChips> {
  // Has list of selectable options
  int _selectedOption = -1;
  List<String> _chipOption = ['University of Texas', 'Invite Code', 'Other'];
  List<String> _chipValueOption = ['@utexas.edu', 'code', 'other'];
  Widget _buildChips(context) {
    List<Widget> chips = [];
    for (int i = 0; i < _chipOption.length; i++) {
      // For every option it creates a chip and then adds it to the chips list
      ChoiceChip choiceChip = ChoiceChip(
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        label: Container(
          height: getHeight(0.05, context),
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
          // This changes the state of the school selected
          BlocProvider.of<OnboardingStageCubit>(context)
              .selectSchool("${_chipValueOption[i]}", context);
          // Sets the state locally for the chip to read, it can also be done thorugh a cubit
          setState(() {
            if (selected) {
              _selectedOption = i;
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

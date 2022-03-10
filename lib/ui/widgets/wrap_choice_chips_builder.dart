import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';

class WrapChoiceChips extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;
  const WrapChoiceChips(
      {Key? key, required this.reportList, required this.onSelectionChanged})
      : super(key: key);

  @override
  _WrapChoiceChipsState createState() => _WrapChoiceChipsState();
}

class _WrapChoiceChipsState extends State<WrapChoiceChips> {
  List<String> selectedChoices = [];

  _buildChoiceList(context) {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(getWidth(0.01, context)),
        child: ChoiceChip(
          elevation: 2,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          label: Text(
            item,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: getWidth(0.0375, context),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            if (selectedChoices.length < 5) {
              setState(() {
                selectedChoices.contains(item)
                    ? selectedChoices.remove(item)
                    : selectedChoices.add(item);
                widget.onSelectionChanged(selectedChoices);
              });
            } else {
              setState(() {
                selectedChoices.remove(item);
                widget.onSelectionChanged(selectedChoices);
              });
            }
          },
          backgroundColor: Colors.white12,
          selectedColor: Colors.red.shade100,
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(context),
    );
  }
}

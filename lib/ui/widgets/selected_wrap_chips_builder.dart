import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/functions/basic.dart';

class WrapSelectedChips extends StatefulWidget {
  final List<String> selectedList;
  const WrapSelectedChips({Key? key, required this.selectedList})
      : super(key: key);

  @override
  _WrapSelectedChipsState createState() => _WrapSelectedChipsState();
}

class _WrapSelectedChipsState extends State<WrapSelectedChips> {
  Widget _buildChips(context) {
    List<Widget> chips = [];
    widget.selectedList.forEach((item) {
      chips.add(Container(
        padding: EdgeInsets.all(getWidth(0.01, context)),
        child: Chip(
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
          backgroundColor: Colors.white12,
        ),
      ));
    });

    return Wrap(
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChips(context);
  }
}

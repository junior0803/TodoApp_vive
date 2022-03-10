import 'package:flutter/material.dart';

class DimesionButton extends StatelessWidget {
  final String dimension;
  final buttonFunction;

  final Function callback;

  const DimesionButton(
      {Key? key, required this.dimension, required this.buttonFunction, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
        buttonFunction();
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFF4D5A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Center(
        child: Text(
          dimension,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

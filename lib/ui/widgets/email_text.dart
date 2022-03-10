import 'package:flutter/material.dart';

class EmailCode extends StatelessWidget {
  final String title;
  const EmailCode({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class SmallRedButton extends StatelessWidget {
  final String title;
  final buttonFunction;
  final toScreen;
  const SmallRedButton(
      {Key? key, required this.title, this.buttonFunction, this.toScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (toScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => toScreen),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFF4D5A),
        minimumSize: Size(getWidth(0.45, context), getHeight(0.05, context)),
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: SizedBox(
        width: getWidth(0.35, context),
        child: Center(
          child: Text(
            '${this.title}',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, title) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: Text(title),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    actionsAlignment: MainAxisAlignment.spaceAround,
    actions: [
      TextButton(
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {},
      ),
      ElevatedButton(
        child: Text("Confirm"),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          minimumSize: Size(getWidth(0.15, context), getHeight(0.05, context)),
          elevation: 3,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ],
  );

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}

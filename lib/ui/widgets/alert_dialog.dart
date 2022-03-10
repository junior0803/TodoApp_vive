import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: Text("AlertDialog component"),
    actions: [
      ElevatedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          }),
      ElevatedButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}

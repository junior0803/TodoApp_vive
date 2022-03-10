import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFF4D5A),
        minimumSize: Size(getWidth(0.27, context), getHeight(0.04, context)),
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {},
      child: Center(
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }
}

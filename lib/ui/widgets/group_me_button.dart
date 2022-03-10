import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class GroupMeButton extends StatelessWidget {
  final String title;
  final toScreen;
  const GroupMeButton({Key? key, required this.title, this.toScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(getWidth(0.6, context), getHeight(0.05, context)),
        maximumSize: Size(getWidth(0.6, context), getHeight(0.05, context)),
        primary: Colors.pink.shade500,
        elevation: 3,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () {
        if (toScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => toScreen,
            ),
          );
        }
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.question_answer),
            SizedBox(width: getWidth(0.05, context)),
            Text(
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
            )
          ],
        ),
      ),
    );
  }
}

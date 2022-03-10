import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class TimeBubble extends StatelessWidget {
  final String date;
  final String time;
  const TimeBubble({Key? key, required this.date, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 2.0,
            spreadRadius: 0.5,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(getWidth(0.035, context)),
        child: SizedBox(
          width: getWidth(0.9, context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
              ),
              SizedBox(width: getWidth(0.015, context)),
              Text(
                time,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

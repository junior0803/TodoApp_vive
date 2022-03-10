import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class DescriptionBubble extends StatelessWidget {
  final String description;
  const DescriptionBubble({Key? key, required this.description})
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: getHeight(0.015, context)),
              Text(
                description,
                maxLines: 5,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

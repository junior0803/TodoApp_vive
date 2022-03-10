import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class InviteField extends StatelessWidget {
  final profilePicture;
  final String name;
  const InviteField({Key? key, required this.name, this.profilePicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getWidth(0.02, context),
      ),
      child: Container(
        height: getHeight(0.075, context),
        width: getWidth(0.9, context),
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
          padding: EdgeInsets.all(
            getWidth(0.025, context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.person),
              Text(name),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

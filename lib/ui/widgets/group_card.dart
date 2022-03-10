import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class GroupCard extends StatelessWidget {
  final groupPicture;
  final String name;
  const GroupCard({Key? key, required this.name, required this.groupPicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getWidth(0.02, context),
      ),
      child: Container(
        height: getHeight(0.225, context),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Group image
            Image.asset(
              groupPicture,
              fit: BoxFit.fill,
            ),
            // Name of group
            Text(name),
            // Selectable check button
            ElevatedButton(
              onPressed: () {
                // TODO: Change state from unchecked to checked
              },
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
            SizedBox(
              width: getWidth(0.001, context),
            )
          ],
        ),
      ),
    );
  }
}

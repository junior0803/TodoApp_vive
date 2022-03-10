import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class LocationAddressBubble extends StatelessWidget {
  final String location;
  final String address;
  final bool? myUpcomingExperience;
  const LocationAddressBubble(
      {Key? key,
      required this.location,
      required this.address,
      this.myUpcomingExperience})
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: getHeight(0.01, context)),
                  Text(
                    address,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              if (myUpcomingExperience != null)
                ElevatedButton(
                  onPressed: () {
                    print('Navigate Me!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Icon(
                    Icons.near_me_outlined,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

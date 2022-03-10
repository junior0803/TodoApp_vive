import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class ExperienceCard extends StatelessWidget {
  final profilePicture;
  final String name;
  final String location;
  final toScreen;
  final bool? myExperience;
  const ExperienceCard({
    Key? key,
    required this.profilePicture,
    required this.name,
    required this.location,
    required this.toScreen,
    this.myExperience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => toScreen),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(
          getWidth(0.015, context),
        ),
        child: Container(
          height: getHeight(0.275, context),
          width: getWidth(0.95, context),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                profilePicture,
                fit: BoxFit.fill,
              ),
              SizedBox(width: getWidth(0.1, context)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(name),
                  Text(location),
                  if (myExperience == true)
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
            ],
          ),
        ),
      ),
    );
  }
}

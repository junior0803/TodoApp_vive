import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/discover/user_profile_screen.dart';

class FriendCard extends StatelessWidget {
  final profilePicture;
  final String name;
  const FriendCard({
    Key? key,
    required this.name,
    required this.profilePicture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getWidth(0.02, context),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => UserProfileScreen(
                  name: name,
                  profilePicture: profilePicture,
                ),
              ),
            );
          },
          child: Container(
            height: getHeight(0.1, context),
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
                Image.asset(
                  profilePicture,
                  fit: BoxFit.fill,
                ),
                Text(name),
                SizedBox(
                  width: getWidth(0.001, context),
                )
              ],
            ),
          )),
    );
  }
}

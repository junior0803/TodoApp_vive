import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/multiple/group_screen.dart';

class GroupBlock extends StatelessWidget {
  final String groupName;
  final bool? myGroup;
  const GroupBlock({Key? key, required this.groupName, this.myGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  GroupScreen(groupName: groupName, myGroup: myGroup)),
        );
      },
      child: Stack(
        children: [
          Container(
            width: getWidth(0.275, context),
            height: getWidth(0.275, context),
            child: Image.asset(
              'assets/201_855.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: getHeight(0.01, context),
            left: getWidth(0.01, context),
            right: getWidth(0.01, context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white,
              ),
              child: Center(
                child: Text('Group Name'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

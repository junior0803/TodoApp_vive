import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/discover/group_create_screen.dart';
import 'package:vives/ui/widgets/group_block.dart';
import 'package:vives/ui/widgets/group_me_button.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/tab_bar_profile.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';
import 'package:vives/ui/widgets/white_button.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarProfile(),
            Padding(
                padding: EdgeInsets.all(getWidth(0.025, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: GroupMeButton(title: 'Group Me')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Groups',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        WhiteButton(
                          title: 'Create +',
                          customTextColor: Colors.red,
                          toScreen: CreateGroupScreen(),
                        )
                      ],
                    ),
                    SizedBox(height: getHeight(0.015, context)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GroupBlock(groupName: 'Test Group'),
                          SizedBox(width: getWidth(0.025, context)),
                          GroupBlock(groupName: 'Test Group'),
                          SizedBox(width: getWidth(0.025, context)),
                          GroupBlock(groupName: 'Test Group'),
                          SizedBox(width: getWidth(0.025, context)),
                          GroupBlock(groupName: 'Test Group'),
                          SizedBox(width: getWidth(0.025, context)),
                          GroupBlock(groupName: 'Test Group'),
                          SizedBox(width: getWidth(0.025, context)),
                          GroupBlock(groupName: 'Test Group'),
                          SizedBox(width: getWidth(0.025, context)),
                          GroupBlock(groupName: 'Test Group'),
                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(0.015, context)),
                    Text(
                      'Experiences',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/group_card.dart';

class GroupSelectionScreen extends StatelessWidget {
  const GroupSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Select Group',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        // This is a vertical list view of groups to post as
        /*
          TODO: Make each group selectable to then post as a group hangout and
            be shown as so within the map and hangout/experince info screen
          TODO: Groups should be rendered from the ones that you are currently in
        */
        body: ListView(
          children: [
            GroupCard(
              name: 'Group Name',
              groupPicture: 'assets/201_855.png',
            ),
            GroupCard(
              name: 'Group Name',
              groupPicture: 'assets/201_855.png',
            ),
            GroupCard(
              name: 'Group Name',
              groupPicture: 'assets/201_855.png',
            ),
            GroupCard(
              name: 'Group Name',
              groupPicture: 'assets/201_855.png',
            ),
            GroupCard(
              name: 'Group Name',
              groupPicture: 'assets/201_855.png',
            ),
            GroupCard(
              name: 'Group Name',
              groupPicture: 'assets/201_855.png',
            ),
          ],
        ),
      ),
    );
  }
}

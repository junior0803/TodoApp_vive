import 'package:flutter/material.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/friend_card.dart';
import 'package:vives/ui/widgets/group_card.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({Key? key}) : super(key: key);

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
        body: ListView(
          children: [
            FriendCard(
              name: 'First Last',
              profilePicture: 'assets/201_855.png',
            ),
            FriendCard(
              name: 'First Last',
              profilePicture: 'assets/201_855.png',
            ),
            FriendCard(
              name: 'First Last',
              profilePicture: 'assets/201_855.png',
            ),
            FriendCard(
              name: 'First Last',
              profilePicture: 'assets/201_855.png',
            ),
            FriendCard(
              name: 'First Last',
              profilePicture: 'assets/201_855.png',
            ),
            FriendCard(
              name: 'First Last',
              profilePicture: 'assets/201_855.png',
            ),
          ],
        ),
      ),
    );
  }
}

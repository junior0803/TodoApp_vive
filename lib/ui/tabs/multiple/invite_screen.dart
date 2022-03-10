import 'package:flutter/material.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/invite_field.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Invite',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        body: ListView(
          children: [
            TextInput(hint: 'Search', textInputController: null),
            Column(
              children: [
                InviteField(name: 'First Last'),
                InviteField(name: 'First Last'),
                InviteField(name: 'First Last'),
                InviteField(name: 'First Last'),
                InviteField(name: 'First Last'),
                InviteField(name: 'First Last'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

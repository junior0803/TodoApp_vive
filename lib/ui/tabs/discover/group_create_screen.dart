import 'package:flutter/material.dart';
import 'package:vives/ui/widgets/back_button.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Filter Experiences',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        body: Center(
          child: Text('Create Group Screen'),
        ),
      ),
    );
  }
}

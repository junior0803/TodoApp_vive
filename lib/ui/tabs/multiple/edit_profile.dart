import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/widgets/back_button.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({Key? key}) : super(key: key);

  @override
  _EditMyProfileScreenState createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        body: Column(
          children: [
            SizedBox(height: getHeight(0.025, context)),
            Center(
              child: Container(
                height: getWidth(0.3, context),
                width: getWidth(0.3, context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/201_855.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 2.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/discover/my_experiences_screen.dart';
import 'package:vives/ui/tabs/multiple/edit_profile.dart';
import 'package:vives/ui/tabs/multiple/friend_screen.dart';
import 'package:vives/ui/widgets/back_button.dart';
import 'package:vives/ui/widgets/group_block.dart';
import 'package:vives/ui/widgets/white_button.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final String name = 'First Last';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        leading: BackButtonCustom(),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                BlocProvider.of<AuthenticatorCubit>(context)
                    .logout(context);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              )
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getWidth(0.03, context)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: getHeight(0.15, context),
                    width: getWidth(0.225, context),
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
                  Column(
                    children: [
                      WhiteButton(
                        title: 'Friends',
                        customFontSize: 14.0,
                        toScreen: FriendScreen(),
                      ),
                      SizedBox(height: getHeight(0.015, context)),
                      WhiteButton(
                        title: 'Invites',
                        customFontSize: 14.0,
                        customColor: Colors.red,
                        customTextColor: Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      WhiteButton(
                        title: 'Edit Profile',
                        customFontSize: 14.0,
                        toScreen: EditMyProfileScreen(),
                      ),
                      SizedBox(height: getHeight(0.015, context)),
                      WhiteButton(
                        title: 'Experiences',
                        customFontSize: 14.0,
                        toScreen: MyExperiencesScreen(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: getHeight(0.015, context)),
              Text(
                'Groups',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: getHeight(0.015, context)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GroupBlock(groupName: 'Test Group', myGroup: true),
                    SizedBox(width: getWidth(0.025, context)),
                    GroupBlock(groupName: 'Test Group', myGroup: true),
                    SizedBox(width: getWidth(0.025, context)),
                    GroupBlock(groupName: 'Test Group', myGroup: true),
                    SizedBox(width: getWidth(0.025, context)),
                    GroupBlock(groupName: 'Test Group', myGroup: true),
                    SizedBox(width: getWidth(0.025, context)),
                    GroupBlock(groupName: 'Test Group', myGroup: true),
                    SizedBox(width: getWidth(0.025, context)),
                    GroupBlock(groupName: 'Test Group', myGroup: true),
                  ],
                ),
              ),
              SizedBox(height: getHeight(0.015, context)),
              Text(
                'About',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: getHeight(0.015, context)),
              Text(
                'Interests',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.all(getWidth(0.025, context)),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  children: [
                    Chip(
                      label: Text(
                        'Running',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Restaurans',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Basketball',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Festivals',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Parties',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(0.015, context)),
              Text(
                'Description',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.all(getWidth(0.025, context)),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  children: [
                    Chip(
                      label: Text(
                        'Goofy',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Ambition',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Dedicaded',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Carrots',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    Chip(
                      label: Text(
                        'Carrots',
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/experience_post_info.dart';
import 'package:vives/ui/tabs/map/group_selection_screen.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

enum Exclusivity {
  public,
  all_friends,
  private,
}

var exclusivityDict = {
  0: 'public',
  1: 'all_friends',
  2: 'private',
};

enum Category {
  food,
  party,
  nature,
}

var categoryDict = {
  0: 'food',
  1: 'party',
  2: 'nature',
};

class CreationScreenOne extends StatefulWidget {
  const CreationScreenOne({Key? key}) : super(key: key);

  @override
  _CreationScreenOneState createState() => _CreationScreenOneState();
}

class _CreationScreenOneState extends State<CreationScreenOne> {
  Exclusivity _exclusivity = Exclusivity.public;
  Category _category = Category.food;
  TextEditingController _experienceNameController = TextEditingController();

  void setSectionOneData(group, experienceName, exclusivity, category) {
    print('$group, $experienceName, $exclusivity, $category');
    experiencePostInfo.setGroup = group;
    experiencePostInfo.setExperienceName = experienceName;
    experiencePostInfo.setExclusivity = exclusivity;
    experiencePostInfo.setCategory = category;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO: The button should be replaced by the group selected
        Positioned(
          top: MediaQuery.of(context).size.height * 0.125,
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          child: RedButton(
            title: 'Post As Group',
            toScreen: GroupSelectionScreen(),
          ),
        ),
        // TODO: Group Me button should change Next text button to a post redbutton wich
        // should post and then notify other users in the app based on a ranking
        Positioned(
          top: MediaQuery.of(context).size.height * 0.225,
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          child: RedButton(title: 'Group Me'),
        ),
        // Positioned(
        //   top: MediaQuery.of(context).size.height * 0.25,
        //   left: MediaQuery.of(context).size.width * 0.15,
        //   right: MediaQuery.of(context).size.width * 0.15,
        //   child: TextInput(
        //       hint: 'Experience Name',
        //       textInputController: _experienceNameController),
        // ),

        Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.35,
          child: Text(
            'Exclusivity',
            style: TextStyle(
                fontSize: getWidth(0.05, context), fontWeight: FontWeight.w600),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.4,
          child: Wrap(
            spacing: getWidth(0.05, context),
            children: [
              ChoiceChip(
                backgroundColor: Colors.grey,
                selectedColor: Colors.pink,
                selected: _exclusivity == Exclusivity.public,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(getWidth(0.01, context)),
                label: const Text(
                  'Public',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
                onSelected: (selected) {
                  setState(() => _exclusivity = Exclusivity.public);
                },
              ),
              ChoiceChip(
                backgroundColor: Colors.grey,
                selectedColor: Colors.pink,
                selected: _exclusivity == Exclusivity.all_friends,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(getWidth(0.01, context)),
                label: const Text(
                  'All Friends',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
                onSelected: (selected) {
                  setState(() => _exclusivity = Exclusivity.all_friends);
                },
              ),
              ChoiceChip(
                backgroundColor: Colors.grey,
                selectedColor: Colors.pink,
                selected: _exclusivity == Exclusivity.private,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(getWidth(0.01, context)),
                label: const Text(
                  'Private',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
                onSelected: (selected) {
                  setState(() => _exclusivity = Exclusivity.private);
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.55,
          child: Text(
            'Category',
            style: TextStyle(
                fontSize: getWidth(0.05, context), fontWeight: FontWeight.w600),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.6,
          child: Wrap(
            spacing: getWidth(0.05, context),
            children: [
              ChoiceChip(
                backgroundColor: Colors.grey,
                selectedColor: Colors.orange,
                selected: _category == Category.food,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(getWidth(0.01, context)),
                label: const Text(
                  'Food',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
                onSelected: (selected) {
                  setState(() => _category = Category.food);
                },
              ),
              ChoiceChip(
                backgroundColor: Colors.grey,
                selectedColor: Colors.blue,
                selected: _category == Category.party,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(getWidth(0.01, context)),
                label: const Text(
                  'Party',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
                onSelected: (selected) {
                  setState(() => _category = Category.party);
                },
              ),
              ChoiceChip(
                backgroundColor: Colors.grey,
                selectedColor: Colors.green,
                selected: _category == Category.nature,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(getWidth(0.01, context)),
                label: const Text(
                  'Nature',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
                onSelected: (selected) {
                  setState(() => _category = Category.nature);
                },
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.075,
              left: MediaQuery.of(context).size.width * 0.3,
              right: MediaQuery.of(context).size.width * 0.3,
              child: RedButton(
                title: 'Next',
                buttonFunction: () {
                  print(_exclusivity.index);
                  BlocProvider.of<ExperiencePostCubit>(context).toSection2();
                  setSectionOneData(
                    'test',
                    _experienceNameController.text,
                    exclusivityDict[_exclusivity.index],
                    categoryDict[_category.index],
                  );
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.025,
              left: MediaQuery.of(context).size.width * 0.4,
              right: MediaQuery.of(context).size.width * 0.4,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<ExperiencePostCubit>(context).toMapHome();
                },
                child: Text(
                  'Back',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

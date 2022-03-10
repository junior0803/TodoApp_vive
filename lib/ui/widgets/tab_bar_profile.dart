import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/map/filter_screen.dart';
import 'package:vives/ui/tabs/multiple/my_profile_screen.dart';
import 'package:vives/ui/widgets/search_bar.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

class TabBarProfile extends StatelessWidget {
  const TabBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: getWidth(0.15, context),
      width: getWidth(1, context),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: CircleBorder(),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FilterScreen()),
                );
              },
              child: Center(
                child: Icon(
                  Icons.filter_alt,
                  color: Colors.black87,
                ),
              ),
            ),
            SearchBar(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyProfileScreen(),
                  ),
                );
              },
              child: Container(
                height: getHeight(0.15, context),
                width: getWidth(0.15, context),
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

            // Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.red,
            //   ),
            //   child: Icon(
            //     Icons.filter,
            //     color: Colors.white,
            //   ),
            // child: Image.asset(
            //   'assets/201_855.png',
            //   fit: BoxFit.fill,
            // ),

            // child: SizedBox(

            // ),
          ],
        ),
      ),
    );
  }
}

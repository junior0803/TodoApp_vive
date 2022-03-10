import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/map/filter_screen.dart';

class MapRedButton extends StatelessWidget {
  final chosenIcon;
  final String title;
  final toScreen;
  const MapRedButton(
      {Key? key,
      required this.chosenIcon,
      required this.title,
      required this.toScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(onPressed: () {}, child: Text("hello"));
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                if (toScreen != null)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => toScreen,
                    ),
                  );
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                shadowColor: Colors.grey,
                primary: Color(0xFFFF4D5A),
                shape: CircleBorder(),
              ),
              child: Padding(
                  padding: EdgeInsets.all(
                    getWidth(0.025, context),
                  ),
                  child: Center(
                    child: Icon(
                      chosenIcon,
                      size: getWidth(0.07, context),
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          Positioned(
            left: getWidth(0.01, context),
            right: getWidth(0.01, context),
            bottom: -getWidth(0.03, context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 2.0,
                    spreadRadius: 0.5,
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: getWidth(0.025, context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

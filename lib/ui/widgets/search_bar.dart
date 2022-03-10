import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(0.65, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
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
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(getWidth(0.015, context)),
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: getWidth(0.02, context),
              ),
              Container(
                width: getWidth(0.45, context),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

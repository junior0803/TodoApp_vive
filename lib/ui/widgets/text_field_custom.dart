import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/models/onboarding_info.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final textInputController;
  late dynamic textToChange;
  late bool? hideText;
  TextInput({
    Key? key,
    required this.hint,
    required this.textInputController,
    this.textToChange,
    this.hideText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: getWidth(0.025, context)),
        child: Container(
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffeae8e8), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.3],
              tileMode: TileMode.clamp,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
          ),
          child:
            TextField(
              // onChanged: (text) {
              //   if (textToChange != null) myAuthInfo.setEmail = text;
              //   // textToChange = text;
              // },
              obscureText: hideText == null ? false : true,
              controller: textInputController,
              textAlign: TextAlign.center,
              cursorHeight: MediaQuery.of(context).size.height * 0.03,
              decoration: InputDecoration(
                  filled: true,
                  hintText: hint,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Color(0xffeae8e8), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Color(0xffeae8e8), width: 1),
                  )
                // border: InputBorder.none,
              ),
            ),
        )
      ),
    );
  }
}

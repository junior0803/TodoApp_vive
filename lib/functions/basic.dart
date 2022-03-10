import 'package:flutter/material.dart';

double getWidth(double size, context) {
  return (MediaQuery.of(context).size.width * size);
}

double getHeight(double size, context) {
  return (MediaQuery.of(context).size.height * size);
}

bool isEmail(String em) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

bool isPassword(String password){
  return password.length > 5 ? true : false;
}

bool isPhoneNumber(String phone){
  String pattern = r'^(?=.*?[0-9]).{10,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(phone);
}
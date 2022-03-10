import 'package:flutter/material.dart';

AuthenticationInfo myAuthInfo = AuthenticationInfo();
ProfileInfo myProfileInfo = ProfileInfo();

class AuthenticationInfo {
  String _email = 'email';
  String _password = 'password';
  String _phoneNumber = '0000000';
  String _inviteCode = '000000';
  String _countryCode = '+1';

  void set setEmail(email) {
    this._email = email;
    // print(this._email);
  }

  void set setPassword(password) {
    this._password = password;
    // print(this._password);
  }

  void set setPhoneNumber(phone){
    this._phoneNumber = this._countryCode + phone;
  }

  void set setInviteCode(code){
    this._inviteCode = code;
  }

  String get getEmail {
    return this._email;
  }

  String get getPassword {
    return this._password;
  }

  String get getPhoneNumber{
    print(this._phoneNumber);
    return this._phoneNumber;
  }

  String get getInviteCode {
    return this._inviteCode;
  }


  void getInfo() {
    print(this._email);
    print(this._password);
    print(this._phoneNumber);
    print(this._inviteCode);
  }

}

class ProfileInfo {
  String _firstName = 'first';
  String _lastName = 'last';
  dynamic _profileSource;
  dynamic _firestoreProfileSource;
  String _year = 'year';
  List _interestTags = [];
  List _preferenceTags = [];
  bool _profileComplete = false;

  void set setFirstName(firstName) {
    this._firstName = firstName;
  }

  void set setLastName(lastName) {
    this._lastName = lastName;
  }

  void set setProfileSource(profileSource) {
    this._profileSource = profileSource;
  }

  void set setFirestoreProfileSource(profileSource) {
    this._firestoreProfileSource = profileSource;
  }

  void set setInterestTags(interestTags) {
    this._interestTags = interestTags;
  }

  void set setPreferenceTags(preferenceTags) {
    this._preferenceTags = preferenceTags;
  }

  void set setYear(year) {
    this._year = year;
  }

  void set setProfileComplete(state){
    this._profileComplete = state;
  }

  String get getFirstName {
    return this._firstName;
  }

  String get getLastName {
    return this._lastName;
  }

  dynamic get profileSource {
    return this._profileSource;
  }

  dynamic get getFirestoreProfileSource {
    return this._firestoreProfileSource;
  }

  String get getYear {
    return this._year;
  }

  List get getInterestTags {
    return this._interestTags;
  }

  List get getPreferenceTags {
    return this._preferenceTags;
  }

  bool get getProfileComplete{
    return this._profileComplete;
  }
}

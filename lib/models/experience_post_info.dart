import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

ExperiencePostInfo experiencePostInfo = ExperiencePostInfo();

class ExperiencePostInfo {
  String _experienceName = 'name';
  String _exclusivity = 'exclusivity';
  String _category = 'category';
  String? _group;
  LatLng _experienceLocation = LatLng(30.285904, -97.739325);
  DateTime? _startTime;
  TimeOfDay? _endTime;
  bool _hideNavState = false;

  dynamic _experiencePhoto;
  dynamic _firestoreSource;

  void set setExperienceName(experienceName) {
    this._experienceName = experienceName;
  }

  String get getExperienceName {
    return this._experienceName;
  }

  void set setExclusivity(exclusivity) {
    this._exclusivity = exclusivity;
  }

  String get getExclusivity {
    return this._exclusivity;
  }

  void set setCategory(category) {
    this._category = category;
  }

  String get getCategory {
    return this._category;
  }

  void set setGroup(group) {
    this._group = group;
  }

  String? get getGroup {
    return this._group;
  }

  void set setExperienceLocation(experienceLocation) {
    this._experienceLocation = experienceLocation;
  }

  LatLng get getExperienceLocation {
    return this._experienceLocation;
  }

  void set setStartTime(startTime) {
    this._startTime = startTime;
  }

  DateTime? get getStartTime {
    return this._startTime;
  }

  void set setEndTime(endTime) {
    this._endTime = endTime;
  }

  TimeOfDay? get getEndTime {
    return this._endTime;
  }

  void set setExperiencePhoto(experiencePhoto) {
    this._experiencePhoto = experiencePhoto;
  }

  dynamic get getExperiencePhoto {
    return this._experiencePhoto;
  }

  void set setFirestoreSource(firestoreSource) {
    this._firestoreSource = firestoreSource;
  }

  dynamic get geFirestoreSource {
    return this._firestoreSource;
  }

  void set setHideNavState(state){
    this._hideNavState = state;
  }

  bool get getHideNavState {
    return this._hideNavState;
  }
}

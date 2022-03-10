part of 'experience_post_cubit.dart';

// class ExperiencePostState {
//   String postSectionState;

//   ExperiencePostState({required this.postSectionState});
// }

// @immutable
abstract class ExperiencePostState {
  dynamic experiencePhotoPath;
}

class InMapHome extends ExperiencePostState {}

class InExperiencePostSection1 extends ExperiencePostState {}

class InExperiencePostSection2 extends ExperiencePostState {}

class InExperiencePostSection3 extends ExperiencePostState {
  InExperiencePostSection3(experiencePhotoPath) {
    super.experiencePhotoPath = experiencePhotoPath;
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'experience_post_state.dart';

class ExperiencePostCubit extends Cubit<ExperiencePostState> {
  // ExperiencePostCubit() : super(ExperiencePostState(postSectionState: 'home'));

  // void toMapHome() {
  //   emit(ExperiencePostState(postSectionState: 'home'));
  // }

  // void toSection1() {
  //   emit(ExperiencePostState(postSectionState: 'section1'));
  // }

  // void toSection2() {
  //   emit(ExperiencePostState(postSectionState: 'section2'));
  // }

  // void toSection3() {
  //   emit(ExperiencePostState(postSectionState: 'section3'));
  // }

  ExperiencePostCubit() : super(InMapHome());

  void toMapHome() {
    emit(InMapHome());
  }

  void toSection1() {
    emit(InExperiencePostSection1());
  }

  void toSection2() {
    emit(InExperiencePostSection2());
  }

  void toSection3() {
    emit(InExperiencePostSection3(null));
  }

  void setExperiencePicture(photoPath) {
    emit(InExperiencePostSection3(photoPath));
  }
}

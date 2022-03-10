part of 'onboarding_cubit.dart';

class OnboardingStageState {
  int stageValue;
  int previousStageValue = 0;
  String? selectedValue;
  dynamic selectedImagePath;

  OnboardingStageState({
    required this.stageValue,
    this.selectedValue,
    this.selectedImagePath,
  });
}

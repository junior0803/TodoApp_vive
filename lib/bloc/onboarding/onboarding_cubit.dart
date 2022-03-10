import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/home.dart';
import 'package:vives/ui/onboarding/interest_screen.dart';
import 'package:vives/ui/onboarding/login_screen.dart';
import 'package:vives/ui/onboarding/name_screen.dart';
import 'package:vives/ui/onboarding/email_password_screen.dart';
import 'package:vives/ui/onboarding/phone_password_screen.dart';
import 'package:vives/ui/onboarding/phone_number_signin_screen.dart';
import 'package:vives/ui/onboarding/preference_screen.dart';
import 'package:vives/ui/onboarding/profile_picture_screen.dart';
import 'package:vives/ui/onboarding/school_selection_screen.dart';
import 'package:vives/ui/onboarding/start_screen.dart';
import 'package:vives/ui/onboarding/email_verification_code_screen.dart';
import 'package:vives/ui/onboarding/phone_verification_code_screen.dart';
import 'package:vives/ui/onboarding/year_selection_screen.dart';

part 'onboarding_state.dart';

class OnboardingStageCubit extends Cubit<OnboardingStageState> {
  OnboardingStageCubit() : super(OnboardingStageState(stageValue: 0));

  int getStateStage() {
    return super.state.stageValue;
  }

  void backtrackStageValue() {
    super.state.stageValue = super.state.previousStageValue;
  }

  void emitStageOntoNavigator(stageValue, context, page, replace) {
    super.state.previousStageValue = super.state.stageValue;
    emit(OnboardingStageState(stageValue: stageValue));
    if (replace) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => page));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }

  void selectSchool(value, context) {
    emit(
      OnboardingStageState(
        stageValue:
            BlocProvider.of<OnboardingStageCubit>(context).getStateStage(),
        selectedValue: value,
      ),
    );
  }

  void selectImage(imagePath, context) {
    emit(
      OnboardingStageState(
        stageValue:
            BlocProvider.of<OnboardingStageCubit>(context).getStateStage(),
        selectedImagePath: imagePath,
      ),
    );
  }

  void provideBloc(invoker, context) {
    switch (invoker) {
      case "schoolSelection":
        BlocProvider.of<OnboardingStageCubit>(context).schoolSelection(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("SCHOOL SELECTION");
        break;
      case "start":
        BlocProvider.of<OnboardingStageCubit>(context).start(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("START");
        break;
      case "passwordEmailAccount":
        BlocProvider.of<OnboardingStageCubit>(context)
            .EmailpasswordCreation(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("PASSWORD ACCOUNT");
        break;

        case "passwordPhoneAccount":
        BlocProvider.of<OnboardingStageCubit>(context)
            .PhonepasswordCreation(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("PASSWORD ACCOUNT");
        break;

      case "verificationEmailSignUpCode":
        BlocProvider.of<OnboardingStageCubit>(context)
            .verificationEmailSignUpCode(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("VERIFICATION EMAIL SIGN UP CODE");
        break;
      case "verificationPhoneSignUpCode":
        BlocProvider.of<OnboardingStageCubit>(context)
            .verificationPhoneSignUpCode(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("VERIFICATION PHONE SIGN UP CODE");
        break;
      case "verificationPhoneSignInCode":
        BlocProvider.of<OnboardingStageCubit>(context)
            .verificationPhoneSignInCode(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("VERIFICATION PHONE SIGN IN CODE");
        break;
      case "name":
        BlocProvider.of<OnboardingStageCubit>(context).name(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("NAME");
        break;
      case "profilePic":
        BlocProvider.of<OnboardingStageCubit>(context).profilePicture(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("PROFILE PIC");
        break;
      case "yearSelection":
        BlocProvider.of<OnboardingStageCubit>(context).yearSelection(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("YEAR SELECTION");
        break;
      case "interest":
        BlocProvider.of<OnboardingStageCubit>(context).interest(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("INTEREST");
        break;
      case "preference":
        BlocProvider.of<OnboardingStageCubit>(context).preference(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("PREFERENCE");
        break;
      case "phoneSignUp":
        BlocProvider.of<OnboardingStageCubit>(context).phoneSignUp(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("PHONE SIGN UP");
        break;
      case "phoneSignIn":
        BlocProvider.of<OnboardingStageCubit>(context).phoneSignIn(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("PHONE SIGN IN");
        break;
      case "signIn":
        BlocProvider.of<OnboardingStageCubit>(context).singInScreen(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("SIGN IN SCREEN");
        break;
      case "home":
        BlocProvider.of<OnboardingStageCubit>(context).home(context);
        print(BlocProvider.of<OnboardingStageCubit>(context).getStateStage());
        print("HOME SCREEN");
        break;
      default:
    }
  }

  void start(context) {
    emitStageOntoNavigator(1, context, StartScreen(), true);
  }

  void schoolSelection(context) {
    emitStageOntoNavigator(2, context, SchoolSelectorScreen(), false);
  }

  void EmailpasswordCreation(context) {
    emitStageOntoNavigator(3, context, EmailPasswordScreen(), false);
  }

  void PhonepasswordCreation(context) {
    emitStageOntoNavigator(4, context, PhonePasswordScreen(), false);
  }

  void phoneSignUp(context) {
    emitStageOntoNavigator(5, context, PhoneSignInScreen(), false);
  }

  void verificationEmailSignUpCode(context) {
    emitStageOntoNavigator(6, context, EmailVerificationCodeScreen(), false);
  }

  void verificationPhoneSignUpCode(context) {
    emitStageOntoNavigator(7, context, PhoneVerificationCodeScreen(), false);
  }

  void name(context) {
    emitStageOntoNavigator(8, context, NameScreen(), false);
  }

  void profilePicture(context) {
    emitStageOntoNavigator(9, context, ProfilePictureScreen(), false);
  }

  void yearSelection(context) {
    emitStageOntoNavigator(10, context, YearSelectionScreen(), false);
  }

  void interest(context) {
    emitStageOntoNavigator(11, context, InterestScreen(), false);
  }

  void preference(context) {
    emitStageOntoNavigator(12, context, PreferenceScreen(), false);
  }

  void phoneSignIn(context) {
    emitStageOntoNavigator(13, context, PhoneSignInScreen(), false);
  }

  void verificationPhoneSignInCode(context) {
    emitStageOntoNavigator(14, context, PhoneVerificationCodeScreen(), false);
  }

  void home(context) {
    emitStageOntoNavigator(15, context, Home(), true);
  }

  void singInScreen(context) {
    emitStageOntoNavigator(16, context, LoginScreen(), false);
  }
}

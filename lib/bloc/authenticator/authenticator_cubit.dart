import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/home.dart';
import 'package:vives/models/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vives/ui/onboarding/splash_screen.dart';
import 'package:vives/ui/onboarding/start_screen.dart';

part 'authenticator_state.dart';

class AuthenticatorCubit extends Cubit<AuthenticatorState> {
  // late dynamic user;

  AuthenticatorCubit() : super(AuthenticatorState(user: auth.currentUser));
  String? verificationId;
  bool profileComplete = false;
  // void signupEmailLink(String emailAuth, emailLink) async {
  //   await auth.signInWithEmailLink(email: emailAuth, emailLink: emailLink);
  // }

  // Future<void> checkEmailVerified() async {
  //   user = auth.currentUser;
  //   await user.reload();
  //   if (user.emailVerified == true) {
  //     print('true');
  //   } else {
  //     print('false');
  //   }
  // }

  // void verifyEmail() async {
  //   auth.currentUser!.sendEmailVerification();
  // }

  Future<void> getProfileInfoComplete(user) async {
    print("currentUser uid = " + user!.uid);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists){
        profileComplete = true;
        emit(IsAccountComplete(user));
      }
    }
    );
    profileComplete = false;
  }

  void completeProfile(user) async {
    print('hello');
    emit(IsAccountComplete(user));
  }

  void signupWithEmail(String email, String password, BuildContext context) async {
    print(email);
    print(password);
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((result) async {
        User? user = FirebaseAuth.instance.currentUser;
        if (user!= null && !user.emailVerified) {
          await user.sendEmailVerification();
        }
        BlocProvider.of<OnboardingStageCubit>(context)
            .provideBloc('verificationEmailSignUpCode', context);
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Error"),
                content: Text(err.message),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF4D5A),
                      elevation: 3,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password, context) async {
    try {
      print("login email = " + email
          + " password = " + password);
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((result){
        User? user = auth.currentUser;
        if (user != null && user.emailVerified){
          //getProfileInfoComplete(user);
          BlocProvider.of<OnboardingStageCubit>(context)
              .provideBloc('home', context);
          emit(IsAuthenticated(user));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text('You must verify email or phone'),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFF4D5A),
                        elevation: 3,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text('The password is invalid or the user'),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF4D5A),
                      elevation: 3,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout(context) async {
    await auth.signOut().then((res){
      BlocProvider.of<OnboardingStageCubit>(context)
          .provideBloc('start', context);
    });
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => SplashScreen(
    //               route: 'start',s
    //             )));
    // emit(IsNotAuthenticated());
    emit(IsNotAuthenticated());
  }

  // Phone Verification start
  void signInWithPhone(String phone, String SmsCode, String toScreen, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("verification completed ${credential.smsCode}");
        if (credential.smsCode != null) {
          try {
            await auth.signInWithCredential(
                credential);
            User? user = auth.currentUser;
            if (user != null) {
              BlocProvider.of<OnboardingStageCubit>(context)
                  .provideBloc(toScreen, context);
              emit(IsAuthenticated(user));
            } else {
              print("Error");
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'provider-already-linked') {
              await FirebaseAuth.instance.signInWithCredential(credential);
            }
          }
        }
      },
      verificationFailed: _onVerificationFailed,
      codeSent: (String verificationId, [int? forceResendingToken]) async {
        final code = SmsCode.trim();
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }


  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      print("The phone number entered is invalid!");
    }
  }
// Phone Verification end
}

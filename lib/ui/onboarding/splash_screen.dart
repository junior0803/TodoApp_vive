import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';

class SplashScreen extends StatelessWidget {
  final String route;
  const SplashScreen({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => BlocProvider.of<OnboardingStageCubit>(context)
            .provideBloc(route, context));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Vibes',
          style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 75.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: Color(0xFFFF4D5A)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/bloc/vives_bloc_observer.dart';
import 'package:vives/home.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/ui/onboarding/splash_screen.dart';
import 'package:vives/ui/onboarding/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Bloc. = VivesObserver();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: VivesObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /*
        Three prodivers:
          - Authentication
          - Onboarding
          - Experience Posts
      */
      providers: [
        BlocProvider<AuthenticatorCubit>(
          create: (BuildContext context) => AuthenticatorCubit(),
        ),
        BlocProvider<OnboardingStageCubit>(
          create: (BuildContext context) => OnboardingStageCubit(),
        ),
        BlocProvider<ExperiencePostCubit>(
          create: (BuildContext context) => ExperiencePostCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Vives',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthenticatorCubit, AuthenticatorState>(
          builder: (context, state) {
            // Attempt at showing home vs start screen based on your authentication
            // TODO: Make login ang logout work
            // switch (state.runtimeType) {
            //   case IsAuthenticated:
            //     return SplashScreen(route: 'start');
            // }
            String route;
            switch(state.authstatus){
              case AppStatus.authenticated:
                route = "home";
                break;
              case AppStatus.unauthenticated:
              default:
                route = "start";
            }
            return SplashScreen(route: route);
          },
        ),
      ),
    );
  }
}

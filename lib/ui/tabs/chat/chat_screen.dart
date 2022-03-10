import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/bloc/onboarding/onboarding_cubit.dart';
import 'package:vives/home.dart';
import 'package:vives/models/firebase.dart';
import 'package:vives/ui/widgets/tab_bar_profile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0,
              child: TabBarProfile(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  BlocBuilder<AuthenticatorCubit, AuthenticatorState>(
                    builder: (context, state) {
                      if (state.user == null) {
                        return Text('Null');
                      } else {
                        return Text(state.user!.uid);
                      }
                      // return Text(state.user == null
                      //     ? 'null'
                      //     : state.user!.uid.toString());
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticatorCubit>(context)
                          .logout(context);
                      // BlocProvider.of<OnboardingStageCubit>(context)
                      //     .provideBloc('start', context);
                    },
                    child: Center(
                      child: Text('Log Out'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

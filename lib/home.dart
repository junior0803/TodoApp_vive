import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/authenticator/authenticator_cubit.dart';
import 'package:vives/ui/tabs/chat/chat_screen.dart';
import 'package:vives/ui/tabs/discover/discovery_screen.dart';
import 'package:vives/ui/tabs/map/map_screen.dart';
import 'package:vives/ui/tabs/post/post_screen.dart';
import 'package:vives/ui/widgets/map_red_buttons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'bloc/onboarding/onboarding_cubit.dart';
import 'models/experience_post_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _hideNavbar = false;
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      PostScreen(),
      MapScreen(),
      DiscoveryScreen(),
      ChatScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add_rounded),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.public),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.people),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.forum),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black87,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatorCubit, AuthenticatorState>(
      builder: (context, state){
        print("state.authstatus = " + state.authstatus.toString());
        if (state.authstatus != AppStatus.authenticated) {
          _hideNavbar = true;
        }
        else
          _hideNavbar = false;

        return PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.grey.shade50,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBar: _hideNavbar,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.neumorphic,
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}

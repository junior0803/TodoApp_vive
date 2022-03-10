import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/map/card_view_screen.dart';
import 'package:vives/ui/tabs/map/filter_screen.dart';
import 'package:vives/ui/widgets/large_red_button.dart';
import 'package:vives/ui/widgets/map_creation_section1_stack.dart';
import 'package:vives/ui/widgets/map_creation_section2_stack.dart';
import 'package:vives/ui/widgets/map_creation_section3_stack.dart';
import 'package:vives/ui/widgets/map_dimesion_button.dart';
import 'package:vives/ui/widgets/map_google_integration.dart';
import 'package:vives/ui/widgets/map_home.dart';
import 'package:vives/ui/widgets/map_red_buttons.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:vives/ui/widgets/text_button_custom.dart';
import 'package:vives/ui/widgets/text_field_custom.dart';

enum ExperienceCreation { map, section1, section2, section3 }
enum Exclusivity {
  public,
  all_friends,
  private,
}

/*
  TODO: Map Dimension Screen Does NOT Work
  TODO: Need to implement geolocation feature that requests and shows your current location
    as well as gather the data of your location for navigation safety
  TODO: Should start at your location and show you what is around
  TODO: Render experiences and stuff happening around you as you move the map
 */

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng _coordinates = LatLng(30.285904, -97.739325);
  // late Position currentPosition;
  // late GoogleMapController mapController;

  // List<Marker> _markers = <Marker>[];
  // Iterable _markers = [];

  // _getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   print(position);
  //   currentPosition = position;
  //   // LatLng latlngPosition = LatLng(position.latitude, position.longitude);
  //   // CameraPosition cameraPosition = new CameraPosition(
  //   //   target: latlngPosition,
  //   //   zoom: 15,
  //   //   tilt: 75,
  //   // );
  //   // mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  // }

  // This sets camera view to 3-D
  Completer<GoogleMapController> _controller = Completer();

  Future<void> _cameraDimension() async {
    final GoogleMapController controller = await _controller.future;
    print(_coordinates.latitude);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _coordinates,
          zoom: 17,
          tilt: 75,
        ),
      ),
    );
  }

  // This sets camera view to 2-D
  Future<void> _cameraDimension2() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _coordinates,
          zoom: 15,
          tilt: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
        This is a Bloc provider that reads the state of an experience creation
        when you push the ( + Experience ) button it changes the state.
      */
    return Container(
      child: BlocBuilder<ExperiencePostCubit, ExperiencePostState>(
        builder: (context, state) {
          dynamic
              selectedWidget; // The widgets to show changed based on the state
          bool section2 =
              false; // Set to true when we want to long press to create a marker
          switch (state.runtimeType) {
            case InMapHome:
              selectedWidget = MapHome(
                cameraDimension: _cameraDimension,
                cameraDimension2: _cameraDimension2,
              );
              break;
            case InExperiencePostSection1:
              selectedWidget = CreationScreenOne();
              break;
            case InExperiencePostSection2:
              selectedWidget = CreationSectionTwo();
              section2 = true;
              break;
            case InExperiencePostSection3:
              selectedWidget = CreationSectionThree();
              break;
          }
          // This is the map that takes in the widgets based on the state.
          return GoogleMapBase(
            controller: _controller,
            MapSection: selectedWidget,
            postSection2: section2,
          );
        },
      ),
    );
  }
}

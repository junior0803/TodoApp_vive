import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vives/models/experience_post_info.dart';

/* 
  TODO: Need to add google places api
*/

class GoogleMapBase extends StatefulWidget {
  final controller;
  final MapSection;
  final bool? postSection2;
  GoogleMapBase({
    Key? key,
    required this.controller,
    required this.MapSection,
    this.postSection2,
  }) : super(key: key);

  @override
  _GoogleMapBaseState createState() => _GoogleMapBaseState();
}

class _GoogleMapBaseState extends State<GoogleMapBase> {
  late String _mapStyle;
  // late Position currentPosition;
  late GoogleMapController mapController;
  late LatLng _coordinates = LatLng(30.285904, -97.739325);

  // List<Marker> _markers = <Marker>[];
  // Iterable _markers = [];
  late List<Marker> _experienceMarker = <Marker>[];

  @override
  void initState() {
    super.initState();

    // _getLocation();
    // getData();

    // This sets the map style based on the .txt file
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  // Creates a specific marker of the selected location
  // TODO: Ensure there is only one made for one experience location
  selectExperienceMarker(marker) {
    print(marker.position);
    // Adding may not be the best for one locaiton selected
    setState(() => _experienceMarker.add(marker));
    // The marker is saved to then be used to be pushed into the experience firebase database
    experiencePostInfo.setExperienceLocation = marker.position;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.285904, -97.739325),
    zoom: 17,
    tilt: 75,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(_mapStyle);
            widget.controller.complete(controller);
            mapController = controller;
            // _getLocation();
          },
          onCameraMove: (cp) {
            _coordinates = cp.target;
          },
          markers: Set.from(_experienceMarker),
          // When doing a long press it creates a market to set a hangout location
          onLongPress: (LatLng latlng) {
            if (widget.postSection2 == true)
              selectExperienceMarker(
                Marker(
                  markerId: MarkerId('SomeId'),
                  position: latlng,
                  // TODO: This title should be the category selected
                  infoWindow: InfoWindow(title: 'The title of the marker'),
                ),
              );
            // print(_experienceMarker);
          },
        ),
        // This is the widget that changes based on the current state
        widget.MapSection,
      ],
    );
  }
}

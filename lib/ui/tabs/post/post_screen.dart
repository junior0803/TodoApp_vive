import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

/*
  TODO: Camera Screen
  TODO: Add circle animation when onTapDown for video
  TODO: When picture/video selected change state to group selection, post and save buttons
  TODO: State management to see photo or video selected
*/

class _PostScreenState extends State<PostScreen> {
  XFile? _profilePicturePath;
  dynamic _pickImageError;
  var _picker;
  // Obtain a list of the available cameras on the device.
  // final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  // final firstCamera = cameras.first;

  // @override
  // void initState() {
  //   super.initState();
  //   // To display the current output from the Camera,
  //   // create a CameraController.
  //   _controller = CameraController(
  //     // Get a specific camera from the list of available cameras.
  //     widget.camera,
  //     // Define the resolution to use.
  //     ResolutionPreset.medium,
  //   );

  //   // Next, initialize the controller. This returns a Future.
  //   _initializeControllerFuture = _controller.initialize();
  // }

  // @override
  // void dispose() {
  //   // Dispose of the controller when the widget is disposed.
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // FutureBuilder<void>(
          //   future: _initializeControllerFuture,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       // If the Future is complete, display the preview.
          //       return CameraPreview(_controller);
          //     } else {
          //       // Otherwise, display a loading indicator.
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          Positioned(
            left: getWidth(0.01, context),
            right: getWidth(0.01, context),
            bottom: getWidth(0.05, context),
            child: GestureDetector(
              onTap: () {},
              onTapDown: (_) {},
              child: Padding(
                padding: EdgeInsets.all(
                  getWidth(0.025, context),
                ),
                child: Container(
                  height: getWidth(0.15, context),
                  width: getWidth(0.15, context),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  // child: Center(
                  //   child: Icon(
                  //     Icons.circle,
                  //     size: getWidth(0.07, context),
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

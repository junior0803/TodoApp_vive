import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vives/bloc/post/experience_post_cubit.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/tabs/map/card_view_screen.dart';
import 'package:vives/ui/tabs/map/filter_screen.dart';
import 'package:vives/ui/widgets/map_dimesion_button.dart';
import 'package:vives/ui/widgets/map_red_buttons.dart';

class MapHome extends StatefulWidget {
  final cameraDimension;
  final cameraDimension2;

  const MapHome({
    Key? key,
    required this.cameraDimension,
    required this.cameraDimension2,
  }) : super(key: key);

  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  bool mapMode = false;

  setMapMode() {
    setState(() {
      mapMode = !mapMode;
      print("map mode = " + mapMode.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: MediaQuery.of(context).size.width * 0.025,
          top: MediaQuery.of(context).size.width * 0.10,
          child: DimesionButton(
            dimension: mapMode ? '3-D' : '2-D',
            buttonFunction:
                mapMode ? widget.cameraDimension : widget.cameraDimension2,
            callback: setMapMode,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.075,
          left: MediaQuery.of(context).size.width * 0.001,
          right: MediaQuery.of(context).size.width * 0.001,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: ElevatedButton(
                      onPressed: () {
                        // Uses cubit to change state
                        BlocProvider.of<ExperiencePostCubit>(context)
                            .toSection1();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shadowColor: Colors.grey,
                        primary: Color(0xFFFF4D5A),
                        shape: CircleBorder(),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          getWidth(0.025, context),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: getWidth(0.07, context),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: getWidth(0.01, context),
                    right: getWidth(0.01, context),
                    bottom: -getWidth(0.03, context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 2.0,
                            spreadRadius: 0.5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'Hangout',
                            style: TextStyle(
                              fontSize: getWidth(0.025, context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MapRedButton(
                chosenIcon: Icons.dashboard_rounded,
                title: 'Card View',
                toScreen: CardViewScreen(),
              ),
              MapRedButton(
                chosenIcon: Icons.filter_alt,
                title: 'Filter',
                toScreen: FilterScreen(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

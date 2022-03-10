import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';

enum Timeline { previous, upcoming }

class PreviousUpcomingButton extends StatefulWidget {
  const PreviousUpcomingButton({Key? key}) : super(key: key);

  @override
  _PreviousUpcomingButtonState createState() => _PreviousUpcomingButtonState();
}

class _PreviousUpcomingButtonState extends State<PreviousUpcomingButton> {
  Timeline _timeline = Timeline.upcoming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getWidth(0.025, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip(
            backgroundColor: Colors.grey,
            selectedColor: Colors.green,
            selected: _timeline == Timeline.previous,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(getWidth(0.025, context)),
            label: const Text(
              'Previous',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.0,
                color: Colors.white,
              ),
            ),
            onSelected: (selected) {
              setState(() => _timeline = Timeline.previous);
            },
          ),
          ChoiceChip(
            backgroundColor: Colors.grey,
            selectedColor: Colors.green,
            selected: _timeline == Timeline.upcoming,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(getWidth(0.025, context)),
            label: const Text(
              'Upcoming',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.0,
                color: Colors.white,
              ),
            ),
            onSelected: (selected) {
              setState(() => _timeline = Timeline.upcoming);
            },
          ),
        ],
      ),
    );
  }
}

// class PreviousUpcomingButton extends StatelessWidget {
//   const PreviousUpcomingButton({Key? key}) : super(key: key);

//   Importance _importance = Importance.low;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(getWidth(0.025, context)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ChoiceChip(
//             selectedColor: Colors.black,
//             selected: _importance == Importance.low,
//             label: const Text(
//               'low',
//               style: TextStyle(color: Colors.white),
//             ),
//             onSelected: (selected) {
//               setState(() => _importance = Importance.low);
//             },
//           ),
//           ChoiceChip(
//             selectedColor: Colors.black,
//             selected: _importance == Importance.low,
//             label: const Text(
//               'low',
//               style: TextStyle(color: Colors.white),
//             ),
//             onSelected: (selected) {
//               setState(() => _importance = Importance.low);
//             },
//           ),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     primary: Color(0xFFFF4D5A),
          //     minimumSize:
          //         Size(getWidth(0.45, context), getHeight(0.05, context)),
          //     elevation: 3,
          //     shadowColor: Colors.black,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //   ),
          //   child: SizedBox(
          //     width: getWidth(0.35, context),
          //     child: Center(
          //       child: Text(
          //         'Previous',
                  // style: TextStyle(
                  //   fontFamily: 'Roboto',
                  //   fontSize: 20.0,
                  //   fontWeight: FontWeight.w700,
                  //   fontStyle: FontStyle.normal,
                  //   letterSpacing: 0.0,
                  //   color: Colors.white,
                  // ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     primary: Color(0xFFFF4D5A),
          //     minimumSize:
          //         Size(getWidth(0.45, context), getHeight(0.05, context)),
          //     elevation: 3,
          //     shadowColor: Colors.black,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12.0),
          //     ),
          //   ),
          //   child: SizedBox(
          //     width: getWidth(0.35, context),
          //     child: Center(
          //       child: Text(
          //         'Upcoming',
          //         style: TextStyle(
          //           fontFamily: 'Roboto',
          //           fontSize: 20.0,
          //           fontWeight: FontWeight.w700,
          //           fontStyle: FontStyle.normal,
          //           letterSpacing: 0.0,
          //           color: Colors.white,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
//         ],
//       ),
//     );
//   }
// }

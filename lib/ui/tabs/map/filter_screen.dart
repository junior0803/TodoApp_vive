import 'package:flutter/material.dart';
import 'package:vives/functions/basic.dart';
import 'package:vives/ui/widgets/back_button.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

// TODO: Create an experience filter screen

class _FilterScreenState extends State<FilterScreen> {
  DateTime startDate = new DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime endDate = new DateTime(
    DateTime.now().add(const Duration(days: 6)).year,
    DateTime.now().add(const Duration(days: 6)).month,
    DateTime.now().add(const Duration(days: 6)).day,
  );

  SfRangeValues _values = SfRangeValues(
    // DateTime(2021, 12, 01), DateTime(2021, 12, 07)
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Filter Experiences',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: BackButtonCustom(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getWidth(0.035, context)),
            child: Column(
              children: [
                Text(
                  'When',
                  style: TextStyle(
                    fontSize: getWidth(0.05, context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: getHeight(0.025, context),
                ),
                Text(_values.start.toString()),
                SfRangeSlider(
                  // min: DateTime(2021, 12, 01),
                  // max: DateTime(2021, 12, 08),
                  min: startDate,
                  max: endDate,
                  values: _values,
                  interval: 1,
                  labelPlacement: LabelPlacement.betweenTicks,
                  dateFormat: DateFormat.Md(),
                  dateIntervalType: DateIntervalType.days,
                  showTicks: true,
                  showLabels: true,
                  onChanged: (SfRangeValues newValues) {
                    setState(() {
                      _values = newValues;
                    });
                  },
                ),
                SizedBox(
                  height: getHeight(0.05, context),
                ),
                Text(
                  'What',
                  style: TextStyle(
                    fontSize: getWidth(0.05, context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: getHeight(0.025, context),
                ),
                // Text(DateTime.now().toString()),
                // Text(DateTime.now().add(const Duration(days: 7)).toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

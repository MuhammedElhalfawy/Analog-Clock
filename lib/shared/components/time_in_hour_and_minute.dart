import 'dart:async';

import 'package:clock_app/shared/size_config.dart';
import 'package:flutter/material.dart';

class TimeInHourAndMinute extends StatefulWidget {
  const TimeInHourAndMinute({Key? key}) : super(key: key);

  @override
  State<TimeInHourAndMinute> createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {

  late TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1),
            (timer) {
          if (_timeOfDay.minute != TimeOfDay.now().minute) {
            setState(() {
              _timeOfDay = TimeOfDay.now();
            });
          }
        });
  }
  @override
  Widget build(BuildContext context) {

    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}',
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(width: 5.0,),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18.0),
            ),
          ),
        ),
      ],
    );
  }
}
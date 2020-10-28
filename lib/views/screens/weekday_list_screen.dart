import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';

import 'package:timetable/models/timetable_model.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/screens/day_tt_screen.dart';
import 'package:timetable/views/screens/today_tt_screen.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/day_button.dart';

class WeekDayListScreen extends StatefulWidget {
  @override
  _WeekDayListScreenState createState() => _WeekDayListScreenState();
}

class _WeekDayListScreenState extends State<WeekDayListScreen> {

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<TimeTableProvider>(context).myTime;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              CustomAppBar(title: 'WeekDays', isBackButton: true),
               Column(
                children: [
                  DayButton('Monday', time.timetable.monday),
                  DayButton('Tuesday', time.timetable.tuesday),
                  DayButton('Wednesday', time.timetable.wednesday),
                  DayButton('Thursday', time.timetable.thursday),
                  DayButton('Friday', time.timetable.friday),
                  DayButton('Saturday', time.timetable.saturday),
                ],
              )
            ]),
          ),
        ));
  }
}

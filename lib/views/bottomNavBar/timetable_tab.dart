import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:timetable/models/timetable_model.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/screens/today_tt_screen.dart';
import 'package:timetable/views/screens/weekday_list_screen.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/custom_button.dart';
import 'package:timetable/views/widgets/period_card.dart';

class TimeTableTab extends StatefulWidget {
  @override
  _TimeTableTabState createState() => _TimeTableTabState();
}

class _TimeTableTabState extends State<TimeTableTab> {
  @override
  Widget build(BuildContext context) {
    Period curPeriod =
        Provider.of<TimeTableProvider>(context).getCurrentPeriod();
    Period nextPeriod = Provider.of<TimeTableProvider>(context).getNextPeriod();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          CustomAppBar(title: 'TimeTable', isBackButton: false),
          Column(
            children: [
              CustomButton(
                  title: 'All TimeTable',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return WeekDayListScreen();
                    }));
                  }),
              CustomButton(
                title: 'Today\'s TimeTable',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TodayTTScreen();
                  }));
                },
              ),
              PeriodCard(
                period: curPeriod,
                status: 'ONGOING',
              ),
              PeriodCard(
                period: nextPeriod,
                status: 'NEXT',
              )
            ],
          )
        ]),
      ),
    ));
  }
}

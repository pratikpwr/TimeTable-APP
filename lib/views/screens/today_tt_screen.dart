import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/period_tile.dart';

// Today's TT Screen

class TodayTTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todayTT = Provider.of<TimeTableProvider>(context).getTodayTimeTable();
    DateTime date = DateTime.now();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAppBar(
                title: DateFormat('EEEE').format(date),
                isBackButton: true,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: todayTT.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PeriodTile(day: todayTT[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

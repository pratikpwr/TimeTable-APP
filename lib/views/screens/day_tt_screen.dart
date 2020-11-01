import 'package:flutter/material.dart';
import 'package:timetable/models/timetable_model.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/period_tile.dart';

// Specific Day TT Screen
class DayTTScreen extends StatelessWidget {
  final String title;
  final List<Period> day;

  DayTTScreen(this.title, this.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAppBar(
                title: title,
                isBackButton: true,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: day.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PeriodTile(day: day[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

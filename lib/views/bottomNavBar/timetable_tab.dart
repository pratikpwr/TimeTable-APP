import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:timetable/constants.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/screens/sf_cal.dart';
import 'package:timetable/views/screens/today_tt_screen.dart';
import 'package:timetable/views/screens/weekday_list_screen.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';

class TimeTableTab extends StatefulWidget {
  @override
  _TimeTableTabState createState() => _TimeTableTabState();
}

class _TimeTableTabState extends State<TimeTableTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        CustomAppBar(title: 'TimeTable', isBackButton: false),
        Column(
          children: [
            InkWell(
              onTap: () {
                Provider.of<TimeTableProvider>(context, listen: false).getCurrentPeriod();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return WeekDayListScreen();
                }));

              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                    color: darkBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'All TimeTable',
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TodayTTScreen();
                }));
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                    color: darkBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Today\'s TT',
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SFCal();
                }));

              },
              child: Container(
                width: double.infinity,

                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                    color: darkBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'SF TT',
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),
            ),
          ],
        )
      ]),
    ));
  }
}

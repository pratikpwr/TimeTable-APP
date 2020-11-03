import 'package:flutter/material.dart';
import 'file:///D:/MyProjects/AndroidStudioProjects/1.MainProjects/timetable/lib/views/widgets/work_hori_tile.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/models/timetable_model.dart';
import 'package:timetable/models/work_model.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/providers/work_provider.dart';
import 'package:timetable/views/widgets/period_card.dart';

class HomeTab extends StatelessWidget {
  final NumberFormat formatter = new NumberFormat('00');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: lavender));

    Period curPeriod =
        Provider.of<TimeTableProvider>(context).getCurrentPeriod();
    Period nextPeriod = Provider.of<TimeTableProvider>(context).getNextPeriod();
    var assigns = Provider.of<WorkProvider>(context).works;

    DateTime date = DateTime.now();
    String day = DateFormat('EE, dd MMM').format(date);
    return Scaffold(
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              color: lavender,
              child: Text(
                day,
                style: GoogleFonts.poppins(
                    color: darkSlateBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              alignment: Alignment.centerLeft,
              color: lavender,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Sameer',
                    style: GoogleFonts.poppins(
                        color: darkSlateBlue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Here is a your Schedule \nyou need to check ...',
                    style: GoogleFonts.poppins(
                      color: darkSlateBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 40,
                    color: lavender,
                    child: Container(),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(28)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '     TODAY\'S CLASSES',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PeriodCard(
                          period: curPeriod,
                          status: 'OnGoing',
                        ),
                        PeriodCard(
                          period: nextPeriod,
                          status: 'Next',
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '     YOUR ASSIGNMENTS',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: assigns.assignment.length,
                            itemBuilder: (context, index) {
                              return index > 3
                                  ? null
                                  : WorkHoriTile(assigns, index);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

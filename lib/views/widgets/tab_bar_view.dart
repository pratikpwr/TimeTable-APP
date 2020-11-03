import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/timetable_provider.dart';

class WeekTabView extends StatelessWidget {
  final int weekday;

  WeekTabView(this.weekday);

  final NumberFormat formatter = new NumberFormat('00');

  @override
  Widget build(BuildContext context) {
    var week =
        Provider.of<TimeTableProvider>(context).getWeekDayTimeTable(weekday);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: week.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '${formatter.format(week[index].timeFromHour)}:${formatter.format(week[index].timeFromMinute)}',
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: lightSlateGrey, width: 1.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Text(
                    week[index].course,
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24),
                  ),
                  Text(
                    week[index].teacher,
                    style: GoogleFonts.poppins(
                        color: lightSlateGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

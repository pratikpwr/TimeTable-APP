import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:timetable/constants.dart';
import 'package:timetable/models/timetable_model.dart';

class PeriodCard extends StatelessWidget {
  PeriodCard({
    this.status,
    @required this.period,
  });

  final Period period;
  final String status;

  final NumberFormat formatter = new NumberFormat('00');

  @override
  Widget build(BuildContext context) {
    final totalSize = MediaQuery.of(context).size;
    return Container(
      width: totalSize.width,
      padding: EdgeInsets.symmetric(
          horizontal: 18, vertical: totalSize.height * 0.008),
      margin: EdgeInsets.symmetric(vertical: totalSize.height * 0.008),
      decoration: BoxDecoration(
          color: darkBackground,
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(2.0, 3.0),
              blurRadius: 3.0,
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          status == null
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2.0, 3.0),
                          blurRadius: 3.0,
                        ),
                      ]),
                  child: Text(
                    '$status',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    '${formatter.format(period.timeFromHour)}:${formatter.format(period.timeFromMinute)}',
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    'To',
                    style: GoogleFonts.poppins(
                        color: lightSlateGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Text(
                    '${formatter.format(period.timeToHour)}:${formatter.format(period.timeToMinute)}',
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    period.course,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: primary,
                        fontWeight: FontWeight.w700,
                        fontSize: period.course.length > 12 ? 20 : 24),
                  ),
                  period.teacher.length < 2 || period.teacher.length == null
                      ? SizedBox()
                      : Text(
                          period.teacher,
                          style: GoogleFonts.poppins(
                              color: lightSlateGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: darkBackground,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          status.length < 2
              ? SizedBox()
              : Text(
            '$status :',
            style: GoogleFonts.poppins(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:12 ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: primary, width: 2)),
            child: Column(
              children: [
                Text(
                  period.course,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: primary, fontWeight: FontWeight.bold, fontSize: 32),
                ),
                period.teacher.length < 2
                    ? SizedBox()
                    : Text(
                  period.teacher,
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'From : ',
                    style: GoogleFonts.poppins(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Text(
                    '${formatter.format(period.timeFromHour)}:${formatter.format(period.timeFromMinute)}',
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              // SizedBox(
              //   width: 36,
              // ),
              Row(
                children: [
                  Text(
                    'To : ',
                    style: GoogleFonts.poppins(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Text(
                    '${formatter.format(period.timeToHour)}:${formatter.format(period.timeToMinute)}',
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

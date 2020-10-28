import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/models/timetable_model.dart';

class PeriodTile extends StatelessWidget {
  const PeriodTile({
    Key key,
    @required this.day,
  }) : super(key: key);

  final Period day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      decoration: BoxDecoration(
          color: darkBackground, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 day.timeFrom,
                style: GoogleFonts.mukta(color: textColor, fontSize: 18),
              ),
              Text( day.timeTo,
                  style: GoogleFonts.mukta(color: textColor, fontSize: 18)),
            ],
          ),
          day.teacher.length > 2
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(day.course,
                        maxLines: 2,
                        style: GoogleFonts.mukta(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            // foreground: Paint()..shader = linearTextGradient,
                            fontSize: day.course.length > 5 ? 18 : 30)),
                    Text(day.teacher,
                        style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14))
                  ],
                )
              : Text(day.course,

                  style: GoogleFonts.mukta(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
        ],
      ),
    );
  }
}

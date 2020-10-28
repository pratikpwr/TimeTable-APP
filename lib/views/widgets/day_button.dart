import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/models/timetable_model.dart';
import 'package:timetable/views/screens/day_tt_screen.dart';

class DayButton extends StatelessWidget {
  final String title;
  final List<Period> day;

  DayButton(this.title, this.day);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        highlightColor: background,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DayTTScreen(title, day);
          }));
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
              color: darkBackground, borderRadius: BorderRadius.circular(15)),
          child: Text(
            title.toUpperCase(),
            style: GoogleFonts.poppins(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

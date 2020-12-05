import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/models/work_model.dart';

class WorkHorizontalTile extends StatelessWidget {
  const WorkHorizontalTile(
    this.assigns,
    this.index,
  );

  final WorkModel assigns;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: Offset(2.0, 3.0),
              blurRadius: 3.0,
            ),
          ],
          color: const Color(0xfff4fdf8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deadline',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: lightSlateGrey,
            ),
          ),
          Text(
            assigns.assignment[index].date,
            style: GoogleFonts.poppins(fontSize: 14, color: textColor),
          ),
          Text(
            assigns.assignment[index].workTitle,
            maxLines: 1,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 18, color: primary),
          ),
          Text(
            assigns.assignment[index].workDec,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(fontSize: 14, color: lightSlateGrey),
          ),
          FittedBox(
            child: Text(
              assigns.assignment[index].subject,
              style: GoogleFonts.poppins(
                  fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';

class AssignTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ASSIGNMENTS',
          style: GoogleFonts.poppins(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 32)),
    );
  }
}

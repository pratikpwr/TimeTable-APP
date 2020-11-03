import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color buttonColor;
  final Function onTap;

  CustomButton({@required this.title, @required this.onTap, this.titleColor, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width - 80,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
          decoration: BoxDecoration(
              color: buttonColor ?? primary, boxShadow: [
            new BoxShadow(
              color: const Color(0xff8f86ce),
              offset: Offset(2.0, 3.0),
              blurRadius: 3.0,
            ),
          ],
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: titleColor ?? Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

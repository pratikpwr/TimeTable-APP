import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key key, @required this.title, @required this.isBackButton})
      : super(key: key);

  final String title;
  final bool isBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: isBackButton ?? false
          ? Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(title.toUpperCase(),
                    style: GoogleFonts.mukta(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: title.length > 9 ? 22 : 30)),
              ],
            )
          : Center(
              child: Text(title.toUpperCase(),
                  style: GoogleFonts.mukta(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: title.length > 9 ? 20 : 28)),
            ),
    );
  }
}

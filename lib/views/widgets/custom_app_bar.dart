import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.title,
    @required this.isBackButton
  }) : super(key: key);

  final String title;
  final bool isBackButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isBackButton ? InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: textColor,
              ),
            ),
          ) : SizedBox(),
          SizedBox(
            width: 15,
          ),
          Text(title.toUpperCase(),
              style: GoogleFonts.poppins(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 30)),
          SizedBox(
            width: 50,
          )
        ],
      ),
    );
  }
}

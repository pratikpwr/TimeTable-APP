import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/views/screens/user_data_screen.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Text('PROFILE', style: GoogleFonts.poppins(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 26)),
          ),
          // TODO : that bottom bar error visit medium boring dev
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UserDataScreen();
                }));
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Edit Data',
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

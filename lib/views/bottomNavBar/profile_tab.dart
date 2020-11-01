import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/views/screens/upload_assignment.dart';
import 'package:timetable/views/screens/upload_file_screen.dart';
import 'package:timetable/views/screens/upload_notice.dart';
import 'package:timetable/views/screens/user_data_screen.dart';
import 'package:timetable/views/widgets/custom_button.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Text('PROFILE',
                style: GoogleFonts.poppins(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 26)),
          ),
          // TODO : that bottom bar error visit medium boring dev for edit data
          CustomButton(
              title: 'Change Your Data',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UserDataScreen();
                }));
              }),
          CustomButton(
              title: 'Upload TimeTable',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UploadFileScreen();
                }));
              }),
          CustomButton(
              title: 'Upload New Assignment',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return UploadAssignment();
                }));
              }),
          CustomButton(
              title: 'Upload New Notice',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return UploadNotice();
                }));
              })
        ],
      ),
    );
  }
}

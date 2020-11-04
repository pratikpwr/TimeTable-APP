import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      child: Scaffold(
        backgroundColor: darkBackground,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              alignment: Alignment.centerLeft,
              color: lavender,
              child: Row(
                children: [
                  Icon(
                    Feather.user,
                    color: lightSlateGrey,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                        color: darkSlateBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 40,
                    color: lavender,
                    child: Container(),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(28)),
                    child: Column(
                      children: [
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/work_provider.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';

class AssignTab extends StatefulWidget {
  @override
  _AssignTabState createState() => _AssignTabState();
}

class _AssignTabState extends State<AssignTab> {
  @override
  Widget build(BuildContext context) {
    var assigns = Provider.of<WorkProvider>(context).works;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAppBar(title: 'Assignments', isBackButton: false),
              ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: BouncingScrollPhysics(),
                itemCount: assigns.assignment.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                        color: darkBackground,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              assigns.assignment[index].workTitle,
                              style: GoogleFonts.mukta(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              assigns.assignment[index].subject,
                              style: GoogleFonts.mukta(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          assigns.assignment[index].workDec,
                          style:
                              GoogleFonts.mukta(color: textColor, fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date : ' + assigns.assignment[index].date,
                              style: GoogleFonts.mukta(
                                  color: textColor, fontSize: 15),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'View PDF',
                                  style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          )),
    ));
  }
}

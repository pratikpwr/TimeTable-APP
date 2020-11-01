import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/notice_provider.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';

class NoticeTab extends StatefulWidget {
  @override
  _NoticeTabState createState() => _NoticeTabState();
}

class _NoticeTabState extends State<NoticeTab> {
  @override
  Widget build(BuildContext context) {
    var notices = Provider.of<NoticeProvider>(context).notices;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAppBar(title: 'Notices', isBackButton: false),
              ListView.builder(
                shrinkWrap: true,
                reverse: true,
                physics: BouncingScrollPhysics(),
                itemCount: notices.notices.length,
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
                        Text(
                          notices.notices[index].noticeTitle,
                          style: GoogleFonts.mukta(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          notices.notices[index].noticeDec,
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
                              'Date : ' + notices.notices[index].date,
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

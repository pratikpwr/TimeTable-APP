import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/notice_provider.dart';

class NoticeTab extends StatefulWidget {
  @override
  _NoticeTabState createState() => _NoticeTabState();
}

class _NoticeTabState extends State<NoticeTab> {
  @override
  Widget build(BuildContext context) {
    var notices = Provider.of<NoticeProvider>(context).notices;
    return Scaffold(
        backgroundColor: darkBackground,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                alignment: Alignment.centerLeft,
                color: lavender,
                child: Row(
                  children: [
                    Icon(
                      Feather.bell,
                      color: lightSlateGrey,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Notices',
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: notices.notices.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 12),
                            margin: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            decoration: BoxDecoration(
                                color: darkBackground,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2.0, 3.0),
                                    blurRadius: 3.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      notices.notices[index].noticeTitle,
                                      style: GoogleFonts.mukta(
                                          color: textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  notices.notices[index].noticeDec,
                                  style: GoogleFonts.mukta(
                                      color: textColor, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Notice Date : ' +
                                          notices.notices[index].date,
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
                                            boxShadow: [
                                              new BoxShadow(
                                                color: const Color(0xff8f86ce),
                                                offset: Offset(2.0, 3.0),
                                                blurRadius: 3.0,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          'View PDF',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
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
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

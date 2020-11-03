import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/views/widgets/tab_bar_view.dart';

class TimeTableTab extends StatefulWidget {
  @override
  _TimeTableTabState createState() => _TimeTableTabState();
}

class _TimeTableTabState extends State<TimeTableTab>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabsTitle = <Tab>[
    Tab(
      child: Text(
        'S',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    ),
    Tab(
      child: Text(
        'M',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    ),
    Tab(
      child: Text(
        'T',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    ),
    Tab(
      child: Text(
        'W',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    ),
    Tab(
      child: Text(
        'T',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    ),
    Tab(
      child: Text(
        'F',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    ),
    Tab(
      child: Text(
        'S',
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabsTitle.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String month = DateFormat('MMM').format(date);
    String year = DateFormat('yyyy').format(date);

    return Scaffold(
        backgroundColor: darkBackground,
        body: SafeArea(
          child: Column(children: [
            buildAppBar(month, year),
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
                    child: Container(
                      child: Scaffold(
                          appBar: PreferredSize(
                            preferredSize: Size.fromHeight(kToolbarHeight),
                            child: TabBar(
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BubbleTabIndicator(
                                indicatorHeight: 30.0,
                                indicatorRadius: 10,
                                indicatorColor: primary,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                              tabs: myTabsTitle,
                            ),
                          ),
                          body: TabBarView(
                            controller: _tabController,
                            physics: BouncingScrollPhysics(),
                            children: [
                              // widgetX(int )
                              WeekTabView(7),
                              WeekTabView(1),
                              WeekTabView(2),
                              WeekTabView(3),
                              WeekTabView(4),
                              WeekTabView(5),
                              WeekTabView(6),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  Tab buildTab(title) {
    return Tab(
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, color: lightSlateGrey, fontWeight: FontWeight.w500),
      ),
    );
  }

  Container buildAppBar(String month, String year) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      alignment: Alignment.centerLeft,
      color: lavender,
      child: Row(
        children: [
          Icon(
            FontAwesome.calendar,
            color: lightSlateGrey,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            month,
            style: GoogleFonts.poppins(
                color: darkSlateBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            year,
            style: GoogleFonts.poppins(
                color: darkSlateBlue,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:timetable/constants.dart';
import 'package:timetable/providers/notice_provider.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/providers/work_provider.dart';
import 'package:timetable/views/bottomNavBar/home_tab.dart';
import '../bottomNavBar/assign_tab.dart';
import '../bottomNavBar/notices_tab.dart';
import '../bottomNavBar/profile_tab.dart';
import '../bottomNavBar/timetable_tab.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool _isInit = true;

  @override
  // ignore: must_call_super
  void didChangeDependencies() async {
    if (_isInit) {
      await Future.wait([
        Provider.of<TimeTableProvider>(context).getTimeTable(),
        Provider.of<WorkProvider>(context, listen: false).getWorks(),
        Provider.of<NoticeProvider>(context, listen: false).getNotices()
      ]);
    }
    _isInit = false;
  }

  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: !_isInit
            ? Stack(
                children: [
                  _buildOffstageNavigator(0),
                  _buildOffstageNavigator(1),
                  _buildOffstageNavigator(2),
                  _buildOffstageNavigator(3),
                  _buildOffstageNavigator(4),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          elevation: 0,
          backgroundColor: darkBackground,
          selectedItemColor: primary,
          unselectedItemColor: lightSlateGrey,
          //showSelectedLabels: false,
          selectedLabelStyle: GoogleFonts.poppins(),
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Entypo.home, //entypo, foundation
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesome.calendar,
              ),
              label: 'TIMETABLE',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.clipboard,
              ),
              label: 'ASSIGNMENTS',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.bell,
              ),
              label: 'NOTICES',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.user,
              ),
              label: 'PROFILE',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomeTab(),
          TimeTableTab(),
          AssignTab(),
          NoticeTab(),
          ProfileTab()
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}

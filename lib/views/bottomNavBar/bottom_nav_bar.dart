import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:timetable/constants.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/bottomNavBar/assign_tab.dart';
import 'package:timetable/views/bottomNavBar/notifications_tab.dart';
import 'package:timetable/views/bottomNavBar/profile_tab.dart';
import 'package:timetable/views/bottomNavBar/timetable_tab.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool _isInit = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await Provider.of<TimeTableProvider>(context).getTimeTable();
    }
    _isInit = false;
  }

  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
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
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: darkBackground,
          selectedItemColor: primary,
          unselectedItemColor: textColor,
          //showSelectedLabels: false,
          selectedLabelStyle: GoogleFonts.mukta(),
          showUnselectedLabels: false,
          items: [
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
              label: 'NOTIFICATIONS',
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
        return [TimeTableTab(), AssignTab(), NotificationsTab(), ProfileTab()]
            .elementAt(index);
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetable/providers/notice_provider.dart';
import 'package:timetable/providers/work_provider.dart';

import './constants.dart';
import './providers/timetable_provider.dart';
import './services/local_db.dart';
import './views/bottomNavBar/bottom_nav_bar.dart';
import './views/screens/user_data_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimeTableProvider>(
          create: (ctx) => TimeTableProvider(),
        ),
        ChangeNotifierProvider<WorkProvider>(
          create: (ctx) => WorkProvider(),
        ),
        ChangeNotifierProvider<NoticeProvider>(
          create: (ctx) => NoticeProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: primary,
              accentColor: primary,
              scaffoldBackgroundColor: background),
          home: Control() //UserDataScreen() //
          ),
    );
  }
}

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  String div;
  bool _isLoading = false;

  void getData() async {
    _isLoading = true;
    String d = await LocalDB.getUserDiv();
    setState(() {
      div = d;
    });
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : div == null
            ? UserDataScreen()
            : BottomNavBar();
  }
}

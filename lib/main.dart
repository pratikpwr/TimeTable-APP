import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:timetable/constants.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/services/local_db.dart';
import 'package:timetable/views/bottomNavBar/bottom_nav_bar.dart';
import 'package:timetable/views/screens/user_data_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeTableProvider>(
      create: (ctx) => TimeTableProvider(),
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
    String d = await LocaleDB.getUserDiv();
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

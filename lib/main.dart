import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/screens/weekday_list_screen.dart';
import 'package:timetable/views/screens/today_tt_screen.dart';
import 'package:timetable/views/tab/tab_screen.dart';

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
            scaffoldBackgroundColor: background
          ),
          home: MainScreen()
      ),
    );
    
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/screens/weekday_screen.dart';

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
          home: WeekDayTT()
      ),
    );
    
  }
}


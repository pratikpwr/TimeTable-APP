import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/timetable_model.dart';

class TimeTableProvider extends ChangeNotifier {
  Time _time;

  Time get myTime {
    return _time;
  }

  Future getTimeTable(
      String college, String branch, String std, String div) async {
    Map<String, String> data = {
      'college': college,
      'branch': branch,
      'std': std,
      'div': div
    };
    String body = json.encode(data);
    var header = {"Content-Type": "application/json"};

    try {
      final response = await http.post(
          'https://timetable-flask-app.herokuapp.com/timetable',
          headers: header,
          body: body);

      Time timetable = Time.fromJson(json.decode(response.body));
      _time = timetable;
      notifyListeners();
      return timetable;
    } catch (error) {
      throw (error);
    }
  }

  Future<List<Day>> getTodayTimeTable() async {
    DateTime date = DateTime.now();
    // var day = DateFormat('EEEE').format(date);
    // date.weekday
    await getTimeTable('sitrc', 'comp', 'se', 'b');

    Time time = _time;

    switch (date.weekday) {
      case 1:
        {
          return time.timetable.monday;
        }
        break;

      case 2:
        {
          return time.timetable.tuesday;
        }
        break;

      case 3:
        {
          return time.timetable.wednesday;
        }
        break;

      case 4:
        {
          return time.timetable.thursday;
        }
        break;

      case 5:
        {
          return time.timetable.friday;
        }
        break;

      case 6:
        {
          return time.timetable.saturday;
        }
      case 7:
        {
          print('Holiday');
        }
        break;
      default:
        {
          print('No data');
        }
        break;
    }

    return time.timetable.saturday;
  }
}

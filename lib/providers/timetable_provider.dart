import 'dart:convert';

import 'package:cron/cron.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetable/services/local_db.dart';

import '../models/timetable_model.dart';

class TimeTableProvider extends ChangeNotifier {
  Time _time;

  Time get myTime {
    return _time;
  }

  Future getTimeTable() async {
    String college = await LocaleDB.getUserCollege();
    String branch = await LocaleDB.getUserBranch();
    String std = await LocaleDB.getUserStd();
    String div = await LocaleDB.getUserDiv();

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
    } catch (error) {
      print(error.toString());
      throw (error);
    }
  }

  void getCurrentPeriod() {
    // to get current period
    DateTime _date = DateTime.now();
    String _curHour = DateFormat('hh').format(_date);
    String _curMinute = DateFormat('mm').format(_date);

    DateFormat format = DateFormat('hh:mm');

    String _curTime =
        "${DateFormat('hh').format(_date)}:${DateFormat('mm').format(_date)}";
    List<Period> _todayTT = getTodayTimeTable();

    int i;
    for (i = 0; i < _todayTT.length; i++) {
      print(_curHour);
      print(_todayTT[i].timeFrom);
      if (_curTime == _todayTT[i].timeFrom) {
        // print('time matched');
      }
      // for (j = 0; j < _todayTT[i].timeFrom)
    }

    var cron = new Cron();
    cron.schedule(new Schedule.parse('49 22 * * *'), () async {
      print('10:48');
    });
    // provide this periodNo based on current time it will return period
    var currentPeriod = getTodayTimeTable()[1];
    print(currentPeriod.course);
  }

  List<Period> getTodayTimeTable() {
    DateTime date = DateTime.now();
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
          // TODO : implement sunday with raw values in Server or TimeTable Model
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

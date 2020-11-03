import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../services/local_db.dart';
import '../models/timetable_model.dart';

class TimeTableProvider extends ChangeNotifier {
  Time _time;

  Time get myTime {
    return _time;
  }

  String baseUrl = 'https://timetable-flask-app.herokuapp.com';

  Future getTimeTable() async {
    String college = await LocalDB.getUserCollege();
    String branch = await LocalDB.getUserBranch();
    String std = await LocalDB.getUserStd();
    String div = await LocalDB.getUserDiv();

    String url = '$baseUrl/timetable/$college/$branch/$std/$div';

    try {
      final response = await Dio().get(url);

      // print(response.data.toString());
      Time timetable = Time.fromJson(response.data);
      _time = timetable;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response.data.toString());
      } else {
        print(error.request);
        print(error.message);
      }
    }
  }

  Future uploadTT(String college, String branch, String std, String div,
      String filePath) async {
    String url = '$baseUrl/timetable/$college/$branch/$std/$div';
    try {
      FormData formData = FormData.fromMap(
          {'csv_file': await MultipartFile.fromFile(filePath)});

      var response = await Dio().post(url, data: formData);
      print(response.data.toString());

      Time tt = Time.fromJson(response.data);
      _time = tt;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response.data.toString());
      } else {
        print(error.request);
        print(error.message);
      }
    }
  }

  List<Period> getWeekDayTimeTable(int weekday) {
    //
    Time time = _time;

    switch (weekday) {
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
          //print('Holiday');
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

  Period getCurrentPeriod() {
    final currentTime = DateTime.now();
    int _curYear = int.parse(DateFormat('yyyy').format(currentTime));
    int _curMonth = int.parse(DateFormat('MM').format(currentTime));
    int _curDate = int.parse(DateFormat('dd').format(currentTime));

    DateTime date = DateTime.now();
    List<Period> _todayTT = getWeekDayTimeTable(date.weekday);

    for (int i = 0; i < _todayTT.length; i++) {
      final startTime = DateTime(_curYear, _curMonth, _curDate,
          hourFix(_todayTT[i].timeFromHour), _todayTT[i].timeFromMinute);

      final endTime = DateTime(_curYear, _curMonth, _curDate,
          hourFix(_todayTT[i].timeToHour), _todayTT[i].timeToMinute);

      if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
        return _todayTT[i] ?? testPeriod;
      }
    }
    return testPeriod;
  }

  Period getNextPeriod() {
    final currentTime = DateTime.now();
    int _curYear = int.parse(DateFormat('yyyy').format(currentTime));
    int _curMonth = int.parse(DateFormat('MM').format(currentTime));
    int _curDate = int.parse(DateFormat('dd').format(currentTime));

    DateTime date = DateTime.now();
    List<Period> _todayTT = getWeekDayTimeTable(date.weekday);

    for (int i = 0; i < _todayTT.length; i++) {
      final startTime = DateTime(_curYear, _curMonth, _curDate,
          hourFix(_todayTT[i].timeFromHour), _todayTT[i].timeFromMinute);

      final endTime = DateTime(_curYear, _curMonth, _curDate,
          hourFix(_todayTT[i].timeToHour), _todayTT[i].timeToMinute);

      if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
        int item = i + 1;
        return _todayTT.length > item
            ? _todayTT[item] ?? testPeriod
            : testPeriod;
      }
    }
    return testPeriod;
  }

  //
  Period testPeriod = Period(
      course: 'Currently No Lecture',
      teacher: '',
      timeFromHour: 0,
      timeFromMinute: 00,
      timeToHour: 0,
      timeToMinute: 00);

  // hour fix 12hr and 24hr problem
  int hourFix(time) {
    // if greater than 12 then add +12
    if (time <= 6) {
      return time + 12;
    } else {
      return time;
    }
  }
}

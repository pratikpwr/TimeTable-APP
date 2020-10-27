import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timetable/models/timetable_model.dart';

class ApiServices {
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

    var response = await http.post(
        'https://timetable-flask-app.herokuapp.com/timetable',
        headers: header,
        body: body
    );

    Map<String, dynamic> responseData = json.decode(response.body);
    Time timetable = Time.fromJson(responseData);
    print('data : ' + responseData.toString());
    return timetable;
  }
}

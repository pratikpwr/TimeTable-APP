import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:timetable/models/work_model.dart';
import 'package:timetable/services/local_db.dart';

class WorkProvider extends ChangeNotifier {
  WorkModel _works;

  WorkModel get works {
    return _works;
  }

  String baseUrl = 'https://timetable-flask-app.herokuapp.com';

  Future getWorks() async {
    String college = await LocalDB.getUserCollege();
    String branch = await LocalDB.getUserBranch();
    String std = await LocalDB.getUserStd();
    String div = await LocalDB.getUserDiv();

    String url = '$baseUrl/work/$college/$branch/$std/$div';

    try {
      final response = await Dio().get(url);

      WorkModel notice = WorkModel.fromJson(response.data);
      _works = notice;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response.data.toString());
      } else {
        print(error.message);
      }
    }
  }

  Future uploadWork(college, branch, std, div, pdfPath, workTitle, subject,
      workDesc, date) async {
    String url = '$baseUrl/work/$college/$branch/$std/$div';
    try {
      FormData formData = FormData.fromMap({
        'work_title': workTitle,
        'work_desc': workDesc,
        'subject': subject,
        'date': date,
        'doc': await MultipartFile.fromFile(pdfPath)
      });

      var response = await Dio().post(url, data: formData);
      print(response.data.toString());
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response.data.toString());
      } else {
        print(error.message);
      }
    }
  }

  Future getWorkPdfFromId(id) async {
    String url = '$baseUrl/work/$id';

    try {
      var response = await Dio().get(url);
      // TODO: implement for PDF file
      var pdfFile = response.data;
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response.data.toString());
      } else {
        print(error.message);
      }
    }
  }
}

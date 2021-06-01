import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:timetable/models/notice_model.dart';
import 'package:timetable/services/local_db.dart';

class NoticeProvider extends ChangeNotifier {
  NoticeModel _notices;

  NoticeModel get notices {
    return _notices;
  }

  String baseUrl = 'https://timetable-flask-app.herokuapp.com';

  Future getNotices() async {
    String college = await LocalDB.getUserCollege();
    String branch = await LocalDB.getUserBranch();
    String std = await LocalDB.getUserStd();
    String div = await LocalDB.getUserDiv();

    String url = '$baseUrl/notice/$college/$branch/$std/$div';

    try {
      final response = await Dio().get(url);

      NoticeModel notice = NoticeModel.fromJson(response.data);
      _notices = notice;
      notifyListeners();
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response.data.toString());
      } else {
        print(error.message);
      }
    }
  }

  Future uploadNotice(
      college, branch, std, div, pdfPath, noticeTitle, noticeDesc, date) async {
    String url = '$baseUrl/notice/$college/$branch/$std/$div';
    try {
      FormData formData = FormData.fromMap({
        'notice_title': noticeTitle,
        'notice_desc': noticeDesc,
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

  Future getNoticePdfFromId(id) async {
    String url = '$baseUrl/notice/$id';

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

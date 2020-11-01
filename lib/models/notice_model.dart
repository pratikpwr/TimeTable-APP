// To parse this JSON data, do
//
//     final noticeModel = noticeModelFromJson(jsonString);

import 'dart:convert';

NoticeModel noticeModelFromJson(String str) =>
    NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

class NoticeModel {
  NoticeModel({
    this.notices,
  });

  final List<Notice> notices;

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
        notices: List<Notice>.from(
            json["assignment"].map((x) => Notice.fromJson(x))),
      );

  // TODO: assignments to notices
  Map<String, dynamic> toJson() => {
        "assignment": List<dynamic>.from(notices.map((x) => x.toJson())),
      };
}

class Notice {
  Notice({
    this.id,
    this.noticeTitle,
    this.noticeDec,
    this.date,
  });

  final int id;
  final String noticeTitle;
  final String noticeDec;
  final String date;

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        noticeTitle: json["notice_title"],
        noticeDec: json["notice_dec"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notice_title": noticeTitle,
        "notice_dec": noticeDec,
        "date": date,
      };
}

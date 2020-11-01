// To parse this JSON data, do
//
//     final workModel = workModelFromJson(jsonString);

import 'dart:convert';

WorkModel workModelFromJson(String str) => WorkModel.fromJson(json.decode(str));

String workModelToJson(WorkModel data) => json.encode(data.toJson());

class WorkModel {
  WorkModel({
    this.assignment,
  });

  final List<Assignment> assignment;

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        assignment: List<Assignment>.from(
            json["assignment"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "assignment": List<dynamic>.from(assignment.map((x) => x.toJson())),
      };
}

class Assignment {
  Assignment({
    this.id,
    this.workTitle,
    this.workDec,
    this.subject,
    this.date,
  });

  final int id;
  final String workTitle;
  final String workDec;
  final String subject;
  final String date;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        workTitle: json["work_title"],
        workDec: json["work_dec"],
        subject: json["subject"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "work_title": workTitle,
        "work_dec": workDec,
        "subject": subject,
        "date": date,
      };
}

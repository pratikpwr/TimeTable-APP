// To parse this JSON data, do
//
//     final time = timeFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Time timeFromJson(String str) => Time.fromJson(json.decode(str));

String timeToJson(Time data) => json.encode(data.toJson());

class Time {
  Time({
    this.college,
    this.branch,
    this.std,
    this.div,
    this.timetable,
  });

  final String college;
  final String branch;
  final String std;
  final String div;
  final Timetable timetable;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    college: json["college"],
    branch: json["branch"],
    std: json["std"],
    div: json["div"],
    timetable: Timetable.fromJson(json["timetable"]),
  );

  Map<String, dynamic> toJson() => {
    "college": college,
    "branch": branch,
    "std": std,
    "div": div,
    "timetable": timetable.toJson(),
  };
}

class Timetable {
  Timetable({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  final List<Period> monday;
  final List<Period> tuesday;
  final List<Period> wednesday;
  final List<Period> thursday;
  final List<Period> friday;
  final List<Period> saturday;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
    monday: List<Period>.from(json["Monday"].map((x) => Period.fromJson(x))),
    tuesday: List<Period>.from(json["Tuesday"].map((x) => Period.fromJson(x))),
    wednesday: List<Period>.from(json["Wednesday"].map((x) => Period.fromJson(x))),
    thursday: List<Period>.from(json["Thursday"].map((x) => Period.fromJson(x))),
    friday: List<Period>.from(json["Friday"].map((x) => Period.fromJson(x))),
    saturday: List<Period>.from(json["Saturday"].map((x) => Period.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Monday": List<dynamic>.from(monday.map((x) => x.toJson())),
    "Tuesday": List<dynamic>.from(tuesday.map((x) => x.toJson())),
    "Wednesday": List<dynamic>.from(wednesday.map((x) => x.toJson())),
    "Thursday": List<dynamic>.from(thursday.map((x) => x.toJson())),
    "Friday": List<dynamic>.from(friday.map((x) => x.toJson())),
    "Saturday": List<dynamic>.from(saturday.map((x) => x.toJson())),
  };
}

class Period {
  Period({
    this.course,
    this.teacher,
    this.timeFromHour,
    this.timeFromMinute,
    this.timeToHour,
    this.timeToMinute,
  });

  final String course;
  final String teacher;
  final int timeFromHour;
  final int timeFromMinute;
  final int timeToHour;
  final int timeToMinute;



  factory Period.fromJson(Map<String, dynamic> json) => Period(
    course: json["course"] ?? "",
    teacher: json["teacher"] ?? '',
    timeFromHour: int.parse(json[("timeFromHour")]),
    timeFromMinute: int.parse(json["timeFromMinute"]),
    timeToHour: int.parse(json["timeToHour"]),
    timeToMinute: int.parse(json["timeToMinute"]),
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "teacher": teacher,
    "timeFromHour": timeFromHour,
    "timeFromMinute": timeFromMinute,
    "timeToHour": timeToHour,
    "timeToMinute": timeToMinute,
  };
}

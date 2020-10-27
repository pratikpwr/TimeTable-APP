// To parse this JSON data, do
//
//     final time = timeFromJson(jsonString);

import 'dart:convert';

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

  final List<Day> monday;
  final List<Day> tuesday;
  final List<Day> wednesday;
  final List<Day> thursday;
  final List<Day> friday;
  final List<Day> saturday;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
    monday: List<Day>.from(json["Monday"].map((x) => Day.fromJson(x))),
    tuesday: List<Day>.from(json["Tuesday"].map((x) => Day.fromJson(x))),
    wednesday: List<Day>.from(json["Wednesday"].map((x) => Day.fromJson(x))),
    thursday: List<Day>.from(json["Thursday"].map((x) => Day.fromJson(x))),
    friday: List<Day>.from(json["Friday"].map((x) => Day.fromJson(x))),
    saturday: List<Day>.from(json["Saturday"].map((x) => Day.fromJson(x))),
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

class Day {
  Day({
    this.course,
    this.teacher,
    this.timeFrom,
    this.timeTo,
  });

  final String course;
  final String teacher;
  final String timeFrom;
  final String timeTo;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    course: json["course"] ?? "",
    teacher: json["teacher"] ?? '',
    timeFrom: json["timeFrom"] ?? "",
    timeTo: json["timeTo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "teacher": teacher,
    "timeFrom": timeFrom,
    "timeTo": timeTo,
  };
}

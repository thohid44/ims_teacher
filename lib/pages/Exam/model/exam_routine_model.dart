// To parse this JSON data, do
//
//     final examRoutine = examRoutineFromJson(jsonString);

import 'dart:convert';

ExamRoutineModel examRoutineFromJson(String str) => ExamRoutineModel.fromJson(json.decode(str));



class ExamRoutineModel {
    ExamRoutineModel({
        this.status,
        this.examRoutineClass,
        this.section,
        this.group,
        this.routine,
    });

    bool? status;
    String? examRoutineClass;
    String? section;
    String? group;
    List<Routine>? routine;

    factory ExamRoutineModel.fromJson(Map<String, dynamic> json) => ExamRoutineModel(
        status: json["status"],
        examRoutineClass: json["class"],
        section: json["Section"],
        group: json["group"],
        routine: List<Routine>.from(json["routine"].map((x) => Routine.fromJson(x))),
    );

   get length => null;

   
}

class Routine {
    Routine({
        this.weekday,
        this.hours,
    });

    String? weekday;
    List<Hour>? hours;

    factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        weekday: json["weekday"],
        hours: List<Hour>.from(json["hours"].map((x) => Hour.fromJson(x))),
    );

   
}

class Hour {
    Hour({
        this.name,
        this.start,
        this.end,
        this.subject,
        this.mark,
        this.isBreak,
    });

    String? name;
    String? start;
    String? end;
    String? subject;
    int? mark;
    bool? isBreak;

    factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        name: json["name"],
        start: json["start"],
        end: json["end"],
        subject: json["subject"],
        mark: json["mark"],
        isBreak: json["isBreak"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "start": start,
        "end": end,
        "subject": subject,
        "mark": mark,
        "isBreak": isBreak,
    };
}

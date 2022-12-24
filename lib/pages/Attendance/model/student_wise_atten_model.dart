// To parse this JSON data, do
//
//     final studentWiseAttenModel = studentWiseAttenModelFromJson(jsonString);

import 'dart:convert';

StudentWiseAttenModel studentWiseAttenModelFromJson(String str) => StudentWiseAttenModel.fromJson(json.decode(str));

String studentWiseAttenModelToJson(StudentWiseAttenModel data) => json.encode(data.toJson());

class StudentWiseAttenModel {
    StudentWiseAttenModel({
        this.status,
        this.studentId,
        this.studentName,
        this.studentWiseAttenModelClass,
        this.section,
        this.group,
        this.attendances,
    });

    bool? status;
    String? studentId;
    String? studentName;
    String? studentWiseAttenModelClass;
    Section? section;
    String? group;
    List<Attendance>? attendances;

    factory StudentWiseAttenModel.fromJson(Map<String, dynamic> json) => StudentWiseAttenModel(
        status: json["status"],
        studentId: json["studentId"],
        studentName: json["studentName"],
        studentWiseAttenModelClass: json["class"],
        section: sectionValues.map[json["section"]],
        group: json["group"],
        attendances: List<Attendance>.from(json["attendances"].map((x) => Attendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "studentId": studentId,
        "studentName": studentName,
        "class": studentWiseAttenModelClass,
        "section": sectionValues.reverse[section],
        "group": group,
        "attendances": List<dynamic>.from(attendances!.map((x) => x.toJson())),
    };
}

class Attendance {
    Attendance({
        this.id,
        this.studentAcademicId,
        this.date,
        this.inTime,
        this.outTime,
        this.attnStatus,
    });

    int? id;
    String? studentAcademicId;
    String? date;
    String? inTime;
    String? outTime;
    Section? attnStatus;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        studentAcademicId: json["student_academic_id"],
        date: json["date"],
        inTime: json["inTime"] == null ? null : json["inTime"],
        outTime: json["outTime"] == null ? null : json["outTime"],
        attnStatus: sectionValues.map[json["attnStatus"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_academic_id": studentAcademicId,
        "date": date,
        "inTime": inTime == null ? null : inTime,
        "outTime": outTime == null ? null : outTime,
        "attnStatus": sectionValues.reverse[attnStatus],
    };
}

enum Section { L, A, W, E, D, P, LE }

final sectionValues = EnumValues({
    "A": Section.A,
    "D": Section.D,
    "E": Section.E,
    "L": Section.L,
    "LE": Section.LE,
    "P": Section.P,
    "W": Section.W
});

class EnumValues<T> {
    Map<String, T> map;
  late  Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

List<Students> studentsFromJson(String str) => List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

String studentsToJson(List<Students> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Students {
    Students({
       required this.studentAcademicId,
      required  this.shiftId,
      required  this.attendanceStatusId,
    });

    String studentAcademicId;
    String shiftId;
    String attendanceStatusId;

    factory Students.fromJson(Map<String, dynamic> json) => Students(
        studentAcademicId: json["student_academic_id"],
        shiftId: json["shift_id"],
        attendanceStatusId: json["attendance_status_id"],
    );

    Map<String, dynamic> toJson() => {
        "student_academic_id": studentAcademicId,
        "shift_id": shiftId,
        "attendance_status_id": attendanceStatusId,
    };
}

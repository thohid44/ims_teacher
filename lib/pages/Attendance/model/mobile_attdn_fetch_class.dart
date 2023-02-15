// To parse this JSON data, do
//
//     final mobileAttendFetchClass = mobileAttendFetchClassFromJson(jsonString);

import 'dart:convert';

MobileAttendFetchClass mobileAttendFetchClassFromJson(String str) => MobileAttendFetchClass.fromJson(json.decode(str));

String mobileAttendFetchClassToJson(MobileAttendFetchClass data) => json.encode(data.toJson());

class MobileAttendFetchClass {
    MobileAttendFetchClass({
        this.status,
        this.attendances,
    });

    bool? status;
    List<Attendance>? attendances;

    factory MobileAttendFetchClass.fromJson(Map<String, dynamic> json) => MobileAttendFetchClass(
        status: json["status"],
        attendances: List<Attendance>.from(json["attendances"].map((x) => Attendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "attendances": List<dynamic>.from(attendances!.map((x) => x.toJson())),
    };
}

class Attendance {
    Attendance({
        this.studentAcademicId,
        this.studentId,
        this.studentName,
        this.shiftId,
        this.attendanceStatusId,
    });

    int? studentAcademicId;
    String? studentId;
    String? studentName;
    String? shiftId;
    int? attendanceStatusId;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        studentAcademicId: json["student_academic_id"],
        studentId: json["studentId"],
        studentName: json["studentName"],
        shiftId: json["shift_id"],
        attendanceStatusId: json["attendance_status_id"],
    );

    Map<String, dynamic> toJson() => {
        "student_academic_id": studentAcademicId,
        "studentId": studentId,
        "studentName": studentName,
        "shift_id": shiftId,
        "attendance_status_id": attendanceStatusId,
    };
}

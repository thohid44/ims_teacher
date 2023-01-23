

import 'dart:convert';

AttendanceStoreModel attendanceStoreModelFromJson(String str) => AttendanceStoreModel.fromJson(json.decode(str));

String attendanceStoreModelToJson(AttendanceStoreModel data) => json.encode(data.toJson());

class AttendanceStoreModel {
    AttendanceStoreModel({
        required this.date,
        required this.studentAcademicId,
        required this.shiftId,
        required this.attendanceStatusId,
    });

    String date;
    String studentAcademicId;
    String shiftId;
    String attendanceStatusId;

    factory AttendanceStoreModel.fromJson(Map<String, dynamic> json) => AttendanceStoreModel(
        date: json["date"],
        studentAcademicId: json["student_academic_id"],
        shiftId: json["shift_id"],
        attendanceStatusId: json["attendance_status_id"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "student_academic_id": studentAcademicId,
        "shift_id": shiftId,
        "attendance_status_id": attendanceStatusId,
    };
}


import 'dart:convert';

DailyAttendanceModel dailyAttendanceModelFromJson(String str) => DailyAttendanceModel.fromJson(json.decode(str));

String dailyAttendanceModelToJson(DailyAttendanceModel data) => json.encode(data.toJson());

class DailyAttendanceModel {
    DailyAttendanceModel({
        this.status,
        this.attendances,
    });

    bool? status;
    List<Attendance>? attendances;

    factory DailyAttendanceModel.fromJson(Map<String, dynamic> json) => DailyAttendanceModel(
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
        this.studentName,
        this.studentId,
        this.date,
        this.attendanceClass,
        this.inTime,
        this.outTime,
        this.status,
    });

    String? studentName;
    String? studentId;
    String? date;
    String? attendanceClass;
    dynamic? inTime;
    dynamic? outTime;
    String? status;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        studentName: json["studentName"],
        studentId: json["studentId"],
        date: json["date"],
        attendanceClass: json["class"],
        inTime: json["in_time"],
        outTime: json["out_time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "studentName": studentName,
        "studentId": studentId,
        "date": date,
        "class": attendanceClass,
        "in_time": inTime,
        "out_time": outTime,
        "status": status,
    };
}

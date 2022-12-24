// To parse this JSON data, do
//
//     final dailyAttendanceModel = dailyAttendanceModelFromJson(jsonString);

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
    DateTime? date;
    Class? attendanceClass;
    String? inTime;
    String? outTime;
    String? status;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        studentName: json["studentName"],
        studentId: json["studentId"],
        date: DateTime.parse(json["date"]),
        attendanceClass: classValues.map[json["class"]],
        inTime: json["in_time"],
        outTime: json["out_time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "studentName": studentName,
        "studentId": studentId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "class": classValues.reverse[attendanceClass],
        "in_time": inTime,
        "out_time": outTime,
        "status": status,
    };
}

enum Class { THREE }

final classValues = EnumValues({
    "Three": Class.THREE
});

class EnumValues<T> {
    Map<String, T> map;
 late   Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

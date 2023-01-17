

import 'dart:convert';

MobileAttendFetchClass mobileAttendFetchClassFromJson(String str) => MobileAttendFetchClass.fromJson(json.decode(str));


class MobileAttendFetchClass {
    MobileAttendFetchClass({
        this.status,
        this.attendances,
    });

    bool? status;
    List<Attendance>? attendances;

    factory MobileAttendFetchClass.fromJson(Map<String, dynamic> json) => MobileAttendFetchClass(
        status: json["status"],
        attendances: List<Attendance>.from(json["attendances"]!.map((x) => Attendance.fromJson(x))),
    );
}

class Attendance {
    Attendance({
        this.studentId,
        this.studentName,
        this.status,
    });

    String? studentId;
    String? studentName;
    Status? status;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        studentId: json["studentId"],
        studentName: json["studentName"],
        status: statusValues.map[json["status"]],
    );

   
}

enum Status { LE, E }

final statusValues = EnumValues({
    "E": Status.E,
    "LE": Status.LE
});

class EnumValues<T> {
    Map<String, T> map;
   late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

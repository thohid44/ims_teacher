
import 'dart:convert';
StudentWiseAttenModel studentWiseAttenModelFromJson(String str) => StudentWiseAttenModel.fromJson(json.decode(str));
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
    String? section;
    String? group;
    List<Attendance>? attendances;

    factory StudentWiseAttenModel.fromJson(Map<String, dynamic> json) => StudentWiseAttenModel(
        status: json["status"],
        studentId: json["studentId"],
        studentName: json["studentName"],
        studentWiseAttenModelClass: json["class"],
        section: json["section"],
        group: json["group"],
        attendances: List<Attendance>.from(json["attendances"].map((x) => Attendance.fromJson(x))),
    );


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
    String? attnStatus;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        studentAcademicId: json["student_academic_id"],
        date: json["date"],
        inTime: json["inTime"] == null ? null : json["inTime"],
        outTime: json["outTime"] == null ? null : json["outTime"],
        attnStatus: json['attnStatus'],
    );

  
}

// enum Section { L, A, W, E, D, P, LE }

// final sectionValues = EnumValues({
//     "A": Section.A,
//     "D": Section.D,
//     "E": Section.E,
//     "L": Section.L,
//     "LE": Section.LE,
//     "P": Section.P,
//     "W": Section.W
// });

// class EnumValues<T> {
//     Map<String, T> map;
//   late  Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }

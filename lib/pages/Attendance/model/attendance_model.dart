
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


class Attendance2 {
    Attendance2({
        this.studentAcademicId,
        this.studentId,
        this.studentName,
        this.shiftId,
        this.attendanceStatusId,
        this.status,
    });

    int? studentAcademicId;
    String? studentId;
    String? studentName;
    String? shiftId;
    String? attendanceStatusId;
    String? status;

    factory Attendance2.fromJson(Map<String, dynamic> json) => Attendance2(
        studentAcademicId: json["student_academic_id"],
        studentId: json["studentId"],
        studentName: json["studentName"],
        shiftId: json["shift_id"],
        attendanceStatusId: json["attendance_status_id"],
        status: json["status"],
    );

  get student_academic_id => null;

    Map<String, dynamic> toJson() => {
        "student_academic_id": studentAcademicId,
        "studentId": studentId,
        "studentName": studentName,
        "shift_id": shiftId,
        "attendance_status_id": attendanceStatusId,
        "status": status,
    };
}



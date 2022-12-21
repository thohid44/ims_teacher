// To parse this JSON data, do
//
//     final addNewDiaryModel = addNewDiaryModelFromJson(jsonString);

import 'dart:convert';

AddNewDiaryModel addNewDiaryModelFromJson(String str) => AddNewDiaryModel.fromJson(json.decode(str));

String addNewDiaryModelToJson(AddNewDiaryModel data) => json.encode(data.toJson());

class AddNewDiaryModel {
    AddNewDiaryModel({
        this.status,
        this.diary,
    });

    bool? status;
    Diary? diary;

    factory AddNewDiaryModel.fromJson(Map<String, dynamic> json) => AddNewDiaryModel(
        status: json["status"],
        diary: Diary.fromJson(json["Diary"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Diary": diary!.toJson(),
    };
}

class Diary {
    Diary({
        this.academicClassId,
        this.date,
        this.teacherId,
        this.subjectId,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    String? academicClassId;
    DateTime? date;
    String? teacherId;
    String? subjectId;
    String? description;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        academicClassId: json["academic_class_id"],
        date: DateTime.parse(json["date"]),
        teacherId: json["teacher_id"],
        subjectId: json["subject_id"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "academic_class_id": academicClassId,
        "date": date!.toIso8601String(),
        "teacher_id": teacherId,
        "subject_id": subjectId,
        "description": description,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
    };
}

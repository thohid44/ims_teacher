// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) => SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
    SubjectModel({
        this.status,
        this.subjects,
    });

    bool? status;
    List<Subject>? subjects;

    factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        status: json["status"],
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "subjects": List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    Subject({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

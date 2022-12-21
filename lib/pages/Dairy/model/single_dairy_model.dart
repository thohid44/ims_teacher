// To parse this JSON data, do
//
//     final singleDairyModel = singleDairyModelFromJson(jsonString);

import 'dart:convert';

SingleDairyModel singleDairyModelFromJson(String str) => SingleDairyModel.fromJson(json.decode(str));

String singleDairyModelToJson(SingleDairyModel data) => json.encode(data.toJson());

class SingleDairyModel {
    SingleDairyModel({
        this.status,
        this.diary,
    });

    bool? status;
    Diary? diary;

    factory SingleDairyModel.fromJson(Map<String, dynamic> json) => SingleDairyModel(
        status: json["status"],
        diary: Diary.fromJson(json["diary"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "diary": diary!.toJson(),
    };
}

class Diary {
    Diary({
        this.id,
        this.subject,
        this.date,
        this.teacher,
        this.description,
    });

    String? id;
    String? subject;
    String? date;
    String? teacher;
    String? description;

    factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        id: json["id"],
        subject: json["subject"],
        date: json["date"],
        teacher: json["teacher"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "date": date,
        "teacher": teacher,
        "description": description,
    };
}

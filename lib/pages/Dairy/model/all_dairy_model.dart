// To parse this JSON data, do
//
//     final allDairyModel = allDairyModelFromJson(jsonString);

import 'dart:convert';

AllDairyModel allDairyModelFromJson(String str) => AllDairyModel.fromJson(json.decode(str));

class AllDairyModel {
    AllDairyModel({
        this.status,
        this.allDairyModelClass,
        this.group,
        this.section,
        this.date,
        this.diaries,
    });

    bool? status;
    String? allDairyModelClass;
    String? group;
    String? section;
    String? date;
    List<DiaryElement>? diaries;

    factory AllDairyModel.fromJson(Map<String, dynamic> json) => AllDairyModel(
        status: json["status"],
        allDairyModelClass: json["class"],
        group: json["group"],
        section: json["section"],
        date: json["date"],
        diaries: List<DiaryElement>.from(json["diaries"].map((x) => DiaryElement.fromJson(x))),
    );

   
}

class DiaryElement {
    DiaryElement({
        this.id,
        this.subject,
        this.diary,
    });

    int? id;
    String? subject;
    String? diary;

    factory DiaryElement.fromJson(Map<String, dynamic> json) => DiaryElement(
        id: json["id"],
        subject: json["subject"],
        diary: json["diary"],
    );

   
}


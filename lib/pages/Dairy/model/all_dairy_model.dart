// To parse this JSON data, do
//
//     final allDairyModel = allDairyModelFromJson(jsonString);

import 'dart:convert';

AllDairyModel allDairyModelFromJson(String str) => AllDairyModel.fromJson(json.decode(str));

String allDairyModelToJson(AllDairyModel data) => json.encode(data.toJson());

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
    DateTime? date;
    List<DiaryElement>? diaries;

    factory AllDairyModel.fromJson(Map<String, dynamic> json) => AllDairyModel(
        status: json["status"],
        allDairyModelClass: json["class"],
        group: json["group"],
        section: json["section"],
        date: DateTime.parse(json["date"]),
        diaries: List<DiaryElement>.from(json["diaries"].map((x) => DiaryElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "class": allDairyModelClass,
        "group": group,
        "section": section,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "diaries": List<dynamic>.from(diaries!.map((x) => x.toJson())),
    };
}

class DiaryElement {
    DiaryElement({
        this.id,
        this.subject,
        this.diary,
    });

    int? id;
    Subject? subject;
    DiaryEnum? diary;

    factory DiaryElement.fromJson(Map<String, dynamic> json) => DiaryElement(
        id: json["id"],
        subject: subjectValues.map[json["subject"]],
        diary: diaryEnumValues.map[json["diary"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subjectValues.reverse[subject],
        "diary": diaryEnumValues.reverse[diary],
    };
}

enum DiaryEnum { DESCRIPTION_FROM_RANDOM_GENERATE, TEST_DESCRIPTION }

final diaryEnumValues = EnumValues({
    "Description From Random Generate": DiaryEnum.DESCRIPTION_FROM_RANDOM_GENERATE,
    "Test Description": DiaryEnum.TEST_DESCRIPTION
});

enum Subject { MATH, ENGLISH, BANGLA }

final subjectValues = EnumValues({
    "Bangla": Subject.BANGLA,
    "English": Subject.ENGLISH,
    "Math": Subject.MATH
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

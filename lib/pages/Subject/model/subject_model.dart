// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) => SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
    SubjectModel({
        this.status,
        this.sections,
    });

    bool? status;
    List<Section>? sections;

    factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        status: json["status"],
        sections: List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "sections": List<dynamic>.from(sections!.map((x) => x.toJson())),
    };
}

class Section {
    Section({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

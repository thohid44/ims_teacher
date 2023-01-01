// To parse this JSON data, do
//
//     final academicClassesModel = academicClassesModelFromJson(jsonString);

import 'dart:convert';

AcademicClassesModel academicClassesModelFromJson(String str) => AcademicClassesModel.fromJson(json.decode(str));

String academicClassesModelToJson(AcademicClassesModel data) => json.encode(data.toJson());

class AcademicClassesModel {
    AcademicClassesModel({
        this.status,
        this.classes,
    });

    bool? status;
    List<Class>? classes;

    factory AcademicClassesModel.fromJson(Map<String, dynamic> json) => AcademicClassesModel(
        status: json["status"],
        classes: List<Class>.from(json["classes"].map((x) => Class.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "classes": List<dynamic>.from(classes!.map((x) => x.toJson())),
    };
}

class Class {
    Class({
        this.id,
        this.name,
        this.numericClass,
    });

    int? id;
    String? name;
    String? numericClass;

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        name: json["name"],
        numericClass: json["numericClass"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "numericClass": numericClass,
    };
}

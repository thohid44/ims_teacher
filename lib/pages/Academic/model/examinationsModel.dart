// To parse this JSON data, do
//
//     final examinationsModel = examinationsModelFromJson(jsonString);

import 'dart:convert';

ExaminationsModel examinationsModelFromJson(String str) => ExaminationsModel.fromJson(json.decode(str));



class ExaminationsModel {
    ExaminationsModel({
        this.status,
        this.exams,
    });

    bool? status;
    List<Exam>? exams;

    factory ExaminationsModel.fromJson(Map<String, dynamic> json) => ExaminationsModel(
        status: json["status"],
        exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
    );

    
}

class Exam {
    Exam({
        this.id,
        this.name,
        this.session,
      
    });

    int? id;
    String? name;
    String? session;
    

    factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"],
        name: json["name"],
        session: json["session"],
      
    );

   
}

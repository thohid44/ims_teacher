// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    OtpModel({
        this.authToken,
        this.teacher,
    });

    String? authToken;
    Teacher? teacher;

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        authToken: json["auth_token"],
        teacher: Teacher.fromJson(json["Teacher"]),
    );

    Map<String, dynamic> toJson() => {
        "auth_token": authToken,
        "Teacher": teacher!.toJson(),
    };
}

class Teacher {
    Teacher({
        this.name,
        this.cardId,
        this.dob,
        this.mobile,
        this.image,
        this.email,
        this.joining,
    });

    String? name;
    String? cardId;
    String? dob;
    String? mobile;
    dynamic image;
    String? email;
    String? joining;

    factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        name: json["name"],
        cardId: json["card_id"],
        dob: json["dob"],
        mobile: json["mobile"],
        image: json["image"],
        email: json["email"],
        joining: json["joining"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "card_id": cardId,
        "dob": dob,
        "mobile": mobile,
        "image": image,
        "email": email,
        "joining": joining,
    };
}

// import 'dart:convert';

// OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));



// class OtpModel {
//     OtpModel({
//         this.authToken,
//         this.teacher,
//     });

//     String? authToken;
//     Teacher? teacher;

//     factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
//         authToken: json["auth_token"],
//         teacher: Teacher.fromJson(json["Teacher"]),
//     );

 
// }

// class Teacher {
//     Teacher({
//         this.name,
//         this.cardId,
//         this.dob,
//         this.mobile,
//         this.image,
//         this.email,
//         this.joining,
//     });

//     String? name;
//     String? cardId;
//     DateTime? dob;
//     String? mobile;
//     String? image;
//     dynamic? email;
//     DateTime? joining;

//     factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
//         name: json["name"],
//         cardId: json["card_id"],
//         dob: DateTime.parse(json["dob"]),
//         mobile: json["mobile"],
//         image: json["image"],
//         email: json["email"],
//         joining: DateTime.parse(json["joining"]),
//     );

    
// }

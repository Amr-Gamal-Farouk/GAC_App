// To parse this JSON data, do
//
//     final employModel = employModelFromJson(jsonString);

import 'dart:convert';

import '../../util/values/strings.dart';

List<EmployModel> employModelFromJson(String str) => List<EmployModel>.from(json.decode(str).map((x) => EmployModel.fromJson(x)));

String employModelToJson(List<EmployModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployModel {
    EmployModel({
        required this.id,
        required this.code,
        required this.firstName,
        required this.name,
        required this.company,
        required this.branch,
        required this.department,
        required this.jobTitle,
        required this.extension,
        required this.photo,
    });

    int id;
    String code;
    String firstName;
    String name;
    String company;
    String branch;
    String department;
    String jobTitle;
    String extension;
    String photo;

    factory EmployModel.fromJson(Map<String, dynamic> json) => EmployModel(
        id: (json["id"]!=null)?json["id"]:"Not Provided",
        code:(json["code"]!=null)? json["code"]:"Not Provided",
        firstName:(json["firstName"]!=null)? json["firstName"]:"Not Provided",
        name:(json["name"]!=null)? json["name"]:"Not Provided",
        company:(json["company"]!=null)? json["company"]:"Not Provided",
        branch:(json["branch"]!=null)? json["branch"]:"Not Provided",
        department:(json["department"]!=null)? json["department"]:"Not Provided",
        jobTitle:(json["jobTitle"]!=null)? json["jobTitle"]:"Not Provided",
        extension:(json["extension"]!=null)? json["extension"] == null ? null : json["extension"]:"Not Provided",
        photo:(json["photo"]!=null)? json["photo"] == null ? null : json["photo"]:Strings.profileImage,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "firstName": firstName,
        "name": name,
        "company": company,
        "branch": branch,
        "department": department,
        "jobTitle": jobTitle,
        "extension": extension == null ? null : extension,
        "photo": photo == null ? null : photo,
    };
}

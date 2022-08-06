// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import '../../util/values/strings.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.code,
    required this.name,
    required this.firstName,
    required this.company,
    required this.branch,
    required this.department,
    required this.jobTitle,
    required this.extension,
    required this.directPhone,
    required this.mobile1,
    required this.mobile2,
    required this.officialEmail,
    required this.personalEmail,
    required this.photo,
  });

  int id;
  String code;
  String name;
  String firstName;
  String company;
  String branch;
  String department;
  String jobTitle;
  String extension;
  String directPhone;
  String mobile1;
  String mobile2;
  String officialEmail;
  String personalEmail;
  String photo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: (json["id"]!=null)?json["id"]:"Not Provided",
    code: (json["code"]!=null)?json["code"]:"Not Provided",
    name: (json["name"]!=null)?json["name"]:"Not Provided",
    firstName: (json["firstName"]!=null)?json["firstName"]:"Not Provided",
    company: (json["company"]!=null)?json["company"]:"Not Provided",
    branch: (json["branch"]!=null)?json["branch"]:"Not Provided",
    department: (json["department"]!=null)?json["department"]:"Not Provided",
    jobTitle: (json["jobTitle"]!=null)?json["jobTitle"]:"Not Provided",
    extension: (json["extension"]!=null)?json["extension"]:"Not Provided",
    directPhone: (json["directPhone"]!=null)?json["directPhone"]:"Not Provided",
    mobile1: (json["mobile1"]!=null)?json["mobile1"]:"Not Provided",
    mobile2: (json["mobile2"]!=null)?json["mobile2"]:"Not Provided",
    officialEmail: (json["officialEmail"]!=null)?json["officialEmail"]:"Not Provided",
    personalEmail: (json["personalEmail"]!=null)?json["personalEmail"]:"Not Provided",
    photo: (json["photo"]!=null)?json["photo"]:Strings.profileImage,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "firstName": firstName,
    "company": company,
    "branch": branch,
    "department": department,
    "jobTitle": jobTitle,
    "extension": extension,
    "directPhone": directPhone,
    "mobile1": mobile1,
    "mobile2": mobile2,
    "officialEmail": officialEmail,
    "personalEmail": personalEmail,
    "photo": photo,
  };
}

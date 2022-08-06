// To parse this JSON data, do
//
//     final currentUserModel = currentUserModelFromJson(jsonString);

import 'dart:convert';

CurrentUserModel currentUserModelFromJson(String str) => CurrentUserModel.fromJson(json.decode(str));

String currentUserModelToJson(CurrentUserModel data) => json.encode(data.toJson());

class CurrentUserModel {
  CurrentUserModel({
    required this.accountName,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.email,
    required this.office,
    required this.hrCode,
    required this.enabled,
    required this.domainAdmin,
    required this.archiveAccount,
    required this.serviceAccount,
    required this.passwordExpiryDate,
    required this.applications,
  });

  String accountName;
  String firstName;
  String lastName;
  String displayName;
  String email;
  String office;
  String hrCode;
  bool enabled;
  bool domainAdmin;
  bool archiveAccount;
  bool serviceAccount;
  DateTime passwordExpiryDate;
  dynamic applications;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) => CurrentUserModel(
    accountName: (json["AccountName"]!=null)?json["AccountName"]:"Not Provided",
    firstName: (json["FirstName"]!=null)?json["FirstName"]:"Not Provided",
    lastName: (json["LastName"]!=null)?json["LastName"]:"Not Provided",
    displayName: (json["DisplayName"]!=null)?json["DisplayName"]:"Not Provided",
    email: (json["Email"]!=null)?json["Email"]:"Not Provided",
    office: (json["Office"]!=null)?json["Office"]:"Not Provided",
    hrCode: (json["HRCode"]!=null)?json["HRCode"]:"Not Provided",
    enabled: (json["AccountName"]!=null)?json["Enabled"]:false,
    domainAdmin: (json["AccountName"]!=null)?json["DomainAdmin"]:false,
    archiveAccount: (json["AccountName"]!=null)?json["archiveAccount"]:false,
    serviceAccount: (json["AccountName"]!=null)?json["serviceAccount"]:false,
    passwordExpiryDate: DateTime.parse(json["PasswordExpiryDate"]),
    applications: (json["AccountName"]!=null)?json["Applications"]:"Not Provided",
  );

  Map<String, dynamic> toJson() => {
    "AccountName": accountName,
    "FirstName": firstName,
    "LastName": lastName,
    "DisplayName": displayName,
    "Email": email,
    "Office": office,
    "HRCode": hrCode,
    "Enabled": enabled,
    "DomainAdmin": domainAdmin,
    "archiveAccount": archiveAccount,
    "serviceAccount": serviceAccount,
    "PasswordExpiryDate": passwordExpiryDate.toIso8601String(),
    "Applications": applications,
  };
}

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.token,
    required this.refreshToken,
  });

  String token;
  String refreshToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
  };
}

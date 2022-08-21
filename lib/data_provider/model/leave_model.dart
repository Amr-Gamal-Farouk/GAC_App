
// To parse this JSON data, do
//
//     final leaveModel = leaveModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<LeaveModel> leaveModelFromJson(String str) => List<LeaveModel>.from(json.decode(str).map((x) => LeaveModel.fromJson(x)));

String leaveModelToJson(List<LeaveModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveModel {
  LeaveModel({
    required this.id,
    required this.code,
    required this.year,
    required this.leaveType,
    required this.daysAllowed,
    required this.carriedForward,
    required this.refill,
    required this.daysUsed,
    required this.balance,
  });

  int id;
  String code;
  int year;
  String leaveType;
  int daysAllowed;
  double carriedForward;
  int refill;
  int daysUsed;
  int balance;

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
    id: json["id"],
    code: json["code"],
    year: json["year"],
    leaveType: json["leaveType"],
    daysAllowed: json["daysAllowed"],
    carriedForward: json["carriedForward"].toDouble(),
    refill: json["refill"],
    daysUsed: json["daysUsed"],
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "year": year,
    "leaveType": leaveType,
    "daysAllowed": daysAllowed,
    "carriedForward": carriedForward,
    "refill": refill,
    "daysUsed": daysUsed,
    "balance": balance,
  };
}

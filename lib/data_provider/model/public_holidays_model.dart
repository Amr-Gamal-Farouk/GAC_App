// To parse this JSON data, do
//
//     final publicHolidaysModel = publicHolidaysModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PublicHolidaysModel> publicHolidaysModelFromJson(String str) => List<PublicHolidaysModel>.from(json.decode(str).map((x) => PublicHolidaysModel.fromJson(x)));

String publicHolidaysModelToJson(List<PublicHolidaysModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PublicHolidaysModel {
  PublicHolidaysModel({
    required this.id,
    required this.date,
    required this.description,
  });

  int id;
  DateTime date;
  String description;

  factory PublicHolidaysModel.fromJson(Map<String, dynamic> json) => PublicHolidaysModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "description": description,
  };
}

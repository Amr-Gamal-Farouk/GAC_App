// To parse this JSON data, do
//
//     final departmentChartModel = departmentChartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<DepartmentChartModel> departmentChartModelFromJson(String str) => List<DepartmentChartModel>.from(json.decode(str).map((x) => DepartmentChartModel.fromJson(x)));

String departmentChartModelToJson(List<DepartmentChartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentChartModel {
  DepartmentChartModel({
    required this.id,
    required this.name,
    required this.title,
    required this.level,
    required this.photo,
  });

  int id;
  String name;
  String title;
  int level;
  String photo;

  factory DepartmentChartModel.fromJson(Map<String, dynamic> json) => DepartmentChartModel(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    level: json["level"],
    photo: json["photo"] == null ? null : json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "level": level,
    "photo": photo == null ? null : photo,
  };
}

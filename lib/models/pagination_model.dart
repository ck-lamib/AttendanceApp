// To parse this JSON data, do
//
//     final paginationModel = paginationModelFromJson(jsonString);

import 'dart:convert';
import 'dart:convert' as cv;

PaginationModel paginationModelFromJson(String str) => PaginationModel.fromJson(json.decode(str));

class PaginationModel {
  PaginationModel({
    this.count = 0,
    this.next = "",
    this.previous = "",
    this.results = "",
  });

  int count;
  String next;
  String previous;
  String results;

  factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
        count: json["count"],
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: cv.json.encode(json["results"] ?? ""),
      );
}

// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Categorys categoryFromJson(String str) => Categorys.fromJson(json.decode(str));

String categoryToJson(Categorys data) => json.encode(data.toJson());

class Categorys {
    String? status;
    String? message;
    List<String>? categories;

    Categorys({
        this.status,
        this.message,
        this.categories,
    });

    factory Categorys.fromJson(Map<String, dynamic> json) => Categorys(
        status: json["status"],
        message: json["message"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    };
}

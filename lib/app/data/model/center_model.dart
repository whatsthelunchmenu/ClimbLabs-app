// ignore_for_file: constant_identifier_names

import 'dart:convert';

CenterModel centerModelFromJson(String str) =>
    CenterModel.fromJson(json.decode(str));

String centerModelToJson(CenterModel data) => json.encode(data.toJson());

class CenterModel {
  CenterModel({
    required this.id,
    required this.title,
    required this.level,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.detailStreet,
    required this.scale,
    required this.scaleType,
    required this.thumbNailUrl,
    this.feature = "",
    this.advantages = const [],
    this.disAdvantages = const [],
    this.images = const [],
  });

  int id;
  String title;
  int level;
  String city;
  String zipCode;
  String street;
  String detailStreet;
  int scale;
  String scaleType;
  String feature;
  String thumbNailUrl;
  List<String> advantages;
  List<String> disAdvantages;
  List<String> images;

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
        id: json["id"],
        title: json["title"] ?? "",
        level: json["level"],
        city: json["city"] ?? "",
        zipCode: json["zipCode"] ?? "",
        street: json["street"] ?? "",
        detailStreet: json["detailStreet"] ?? "",
        scale: json["scale"],
        scaleType: json["scaleType"] ?? "",
        feature: json["feature"] ?? "",
        thumbNailUrl: json["thumbNailUrl"] ?? "",
        advantages: json["advantages"] == null
            ? [""]
            : List<String>.from(json["advantages"].map((x) => x)),
        disAdvantages: json["disAdvantages"] == null
            ? [""]
            : List<String>.from(json["disAdvantages"].map((x) => x)),
        images: json["images"] == null
            ? [""]
            : List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "level": level,
        "city": city,
        "zipCode": zipCode,
        "street": street,
        "detailStreet": detailStreet,
        "scale": scale,
        "scaleTypes": scaleType,
        "feature": feature,
        "thumbNailUrl": thumbNailUrl,
        "advantages": List<String>.from(advantages.map((x) => x)),
        "disAdvantages": List<String>.from(disAdvantages.map((x) => x)),
        "images": List<String>.from(images.map((x) => x)),
      };
}

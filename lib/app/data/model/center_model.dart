// ignore_for_file: constant_identifier_names

import 'dart:convert';

CenterModel centerModelFromJson(String str) =>
    CenterModel.fromJson(json.decode(str));

String centerModelToJson(CenterModel data) => json.encode(data.toJson());

class CenterModel {
  CenterModel({
    required this.id,
    required this.climbingTitle,
    required this.level,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.detailStreet,
    required this.scale,
    required this.scaleType,
    this.feature = "",
    this.advantages = const [],
    this.disAdvantages = const [],
    this.images = const [],
  });

  int id;
  String climbingTitle;
  int level;
  String city;
  String zipCode;
  String street;
  String detailStreet;
  int scale;
  String scaleType;
  String feature;
  List<String> advantages;
  List<String> disAdvantages;
  List<String> images;

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
        id: json["id"],
        climbingTitle: json["climbingTitle"],
        level: json["level"],
        city: json["city"],
        zipCode: json["zipCode"],
        street: json["street"],
        detailStreet: json["detailStreet"],
        scale: json["scale"],
        scaleType: json["scaleType"],
        feature: json["feature"] ?? "",
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
        "climbingTitle": climbingTitle,
        "level": level,
        "city": city,
        "zipCode": zipCode,
        "street": street,
        "detailStreet": detailStreet,
        "scale": scale,
        "scaleType": scaleType,
        "feature": feature,
        "advantages": List<String>.from(advantages.map((x) => x)),
        "disAdvantages": List<String>.from(disAdvantages.map((x) => x)),
        "images": List<String>.from(images.map((x) => x)),
      };
}

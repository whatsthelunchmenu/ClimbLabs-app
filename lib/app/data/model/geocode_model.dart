import 'dart:convert';

GeocodeModel geocodeModelFromJson(String str) =>
    GeocodeModel.fromJson(json.decode(str));

String geocodeModelToJson(GeocodeModel data) => json.encode(data.toJson());

class GeocodeModel {
  GeocodeModel({
    this.status = "",
    this.meta = const Meta(),
    this.addresses = const [],
    this.errorMessage = "",
  });

  String status;
  Meta meta;
  List<Address> addresses;
  String errorMessage;

  factory GeocodeModel.fromJson(Map<String, dynamic> json) => GeocodeModel(
        status: json["status"],
        meta: Meta.fromJson(json["meta"]),
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "meta": meta.toJson(),
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class Address {
  Address({
    this.roadAddress = "",
    this.jibunAddress = "",
    this.englishAddress = "",
    this.addressElements = const [],
    this.x = "",
    this.y = "",
    this.distance = 0.0,
  });

  String roadAddress;
  String jibunAddress;
  String englishAddress;
  List<AddressElement> addressElements;
  String x;
  String y;
  double distance;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        roadAddress: json["roadAddress"],
        jibunAddress: json["jibunAddress"],
        englishAddress: json["englishAddress"],
        addressElements: List<AddressElement>.from(
            json["addressElements"].map((x) => AddressElement.fromJson(x))),
        x: json["x"],
        y: json["y"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "roadAddress": roadAddress,
        "jibunAddress": jibunAddress,
        "englishAddress": englishAddress,
        "addressElements":
            List<dynamic>.from(addressElements.map((x) => x.toJson())),
        "x": x,
        "y": y,
        "distance": distance,
      };
}

class AddressElement {
  AddressElement({
    this.types = const [],
    this.longName = "",
    this.shortName = "",
    this.code = "",
  });

  List<String> types;
  String longName;
  String shortName;
  String code;

  factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
        types: List<String>.from(json["types"].map((x) => x)),
        longName: json["longName"],
        shortName: json["shortName"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "types": List<dynamic>.from(types.map((x) => x)),
        "longName": longName,
        "shortName": shortName,
        "code": code,
      };
}

class Meta {
  const Meta({
    this.totalCount = 0,
    this.page = 0,
    this.count = 0,
  });

  final int totalCount;
  final int page;
  final int count;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalCount: json["totalCount"],
        page: json["page"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "page": page,
        "count": count,
      };
}

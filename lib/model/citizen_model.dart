

import 'dart:convert';

CitizenModel citizenModelFromJson(String str) => CitizenModel.fromJson(json.decode(str));

String citizenModelToJson(CitizenModel data) => json.encode(data.toJson());

class CitizenModel {
  CitizenModel({
    this.response,
    this.data,
  });

  Response? response;
  List<Datum>? data;

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
    response: Response.fromJson(json["response"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response!.toJson(),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.name,
    this.image,
    this.available,
    this.citizenTypeId,
  });

  String? name;
  String? image;
  int? available;
  int? citizenTypeId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    image: json["image"],
    available: json["available"],
    citizenTypeId: json["citizen_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "available": available,
    "citizen_type_id": citizenTypeId,
  };
}

class Response {
  Response({
    this.code,
  });

  int? code;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}

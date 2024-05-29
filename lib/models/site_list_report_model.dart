// To parse this JSON data, do
//
//     final siteListReportModel = siteListReportModelFromJson(jsonString);

import 'dart:convert';

SiteListReportModel siteListReportModelFromJson(String str) =>
    SiteListReportModel.fromJson(json.decode(str));

String siteListReportModelToJson(SiteListReportModel data) =>
    json.encode(data.toJson());

class SiteListReportModel {
  int? status;
  String? message;
  List<Datum>? data;

  SiteListReportModel({
    this.status,
    this.message,
    this.data,
  });

  factory SiteListReportModel.fromJson(Map<String, dynamic> json) =>
      SiteListReportModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Status? status;
  String? id;
  String? clientName;
  String? siteNameAndAddress;
  String? siteCode;
  String? state;
  String? city;
  String? siteType;
  List<Shift>? shift;
  List<Deployment>? deployment;
  DateTime? deploymentStart;
  DateTime? deploymentEnd;
  List<Level>? level;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.status,
    this.id,
    this.clientName,
    this.siteNameAndAddress,
    this.siteCode,
    this.state,
    this.city,
    this.siteType,
    this.shift,
    this.deployment,
    this.deploymentStart,
    this.deploymentEnd,
    this.level,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: statusValues.map[json["status"]]!,
        id: json["_id"],
        clientName: json["clientName"],
        siteNameAndAddress: json["siteNameAndAddress"],
        siteCode: json["siteCode"],
        state: json["state"],
        city: json["city"],
        siteType: json["siteType"],
        shift: json["shift"] == null
            ? []
            : List<Shift>.from(json["shift"]!.map((x) => Shift.fromJson(x))),
        deployment: json["deployment"] == null
            ? []
            : List<Deployment>.from(
                json["deployment"]!.map((x) => Deployment.fromJson(x))),
        deploymentStart: json["deploymentStart"] == null
            ? null
            : DateTime.parse(json["deploymentStart"]),
        deploymentEnd: json["deploymentEnd"] == null
            ? null
            : DateTime.parse(json["deploymentEnd"]),
        level: json["level"] == null
            ? []
            : List<Level>.from(json["level"]!.map((x) => Level.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "_id": id,
        "clientName": clientName,
        "siteNameAndAddress": siteNameAndAddress,
        "siteCode": siteCode,
        "state": state,
        "city": city,
        "siteType": siteType,
        "shift": shift == null
            ? []
            : List<dynamic>.from(shift!.map((x) => x.toJson())),
        "deployment": deployment == null
            ? []
            : List<dynamic>.from(deployment!.map((x) => x.toJson())),
        "deploymentStart": deploymentStart?.toIso8601String(),
        "deploymentEnd": deploymentEnd?.toIso8601String(),
        "level": level == null
            ? []
            : List<dynamic>.from(level!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Deployment {
  Role? role;
  int? total;
  String? id;

  Deployment({
    this.role,
    this.total,
    this.id,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) => Deployment(
        role: roleValues.map[json["role"]]!,
        total: json["total"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "role": roleValues.reverse[role],
        "total": total,
        "_id": id,
      };
}

enum Role { SG, SS }

final roleValues = EnumValues({"SG": Role.SG, "SS": Role.SS});

class Level {
  Name? name;
  String? mobile;
  Email? email;
  String? id;

  Level({
    this.name,
    this.mobile,
    this.email,
    this.id,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        name: nameValues.map[json["name"]]!,
        mobile: json["mobile"],
        email: emailValues.map[json["email"]]!,
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "mobile": mobile,
        "email": emailValues.reverse[email],
        "_id": id,
      };
}

enum Email { EXAMPLE_EXAMPLE_COM }

final emailValues =
    EnumValues({"example@example.com": Email.EXAMPLE_EXAMPLE_COM});

enum Name { NAME_OF_LEVEL }

final nameValues = EnumValues({"Name of Level": Name.NAME_OF_LEVEL});

class Shift {
  DateTime? shiftStart;
  DateTime? shiftEnd;
  int? shiftInNumber;
  String? id;

  Shift({
    this.shiftStart,
    this.shiftEnd,
    this.shiftInNumber,
    this.id,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        shiftStart: json["shiftStart"] == null
            ? null
            : DateTime.parse(json["shiftStart"]),
        shiftEnd:
            json["shiftEnd"] == null ? null : DateTime.parse(json["shiftEnd"]),
        shiftInNumber: json["shiftInNumber"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "shiftStart": shiftStart?.toIso8601String(),
        "shiftEnd": shiftEnd?.toIso8601String(),
        "shiftInNumber": shiftInNumber,
        "_id": id,
      };
}

enum Status { PENDING }

final statusValues = EnumValues({"Pending": Status.PENDING});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

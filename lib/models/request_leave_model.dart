// To parse this JSON data, do
//
//     final requestLeaveModel = requestLeaveModelFromJson(jsonString);

import 'dart:convert';

RequestLeaveModel requestLeaveModelFromJson(String str) =>
    RequestLeaveModel.fromJson(json.decode(str));

String requestLeaveModelToJson(RequestLeaveModel data) =>
    json.encode(data.toJson());

class RequestLeaveModel {
  int? status;
  String? message;
  Data? data;

  RequestLeaveModel({
    this.status,
    this.message,
    this.data,
  });

  factory RequestLeaveModel.fromJson(Map<String, dynamic> json) =>
      RequestLeaveModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? userId;
  String? fromDate;
  String? toDate;
  String? reason;
  int? day;
  String? requestStatus;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.userId,
    this.fromDate,
    this.toDate,
    this.reason,
    this.day,
    this.requestStatus,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        reason: json["reason"],
        day: json["day"],
        requestStatus: json["requestStatus"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fromDate": fromDate,
        "toDate": toDate,
        "reason": reason,
        "day": day,
        "requestStatus": requestStatus,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

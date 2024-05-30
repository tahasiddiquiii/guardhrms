// To parse this JSON data, do
//
//     final requestRegularizationModel = requestRegularizationModelFromJson(jsonString);

import 'dart:convert';

RequestRegularizationModel requestRegularizationModelFromJson(String str) =>
    RequestRegularizationModel.fromJson(json.decode(str));

String requestRegularizationModelToJson(RequestRegularizationModel data) =>
    json.encode(data.toJson());

class RequestRegularizationModel {
  int? status;
  String? message;
  Data? data;

  RequestRegularizationModel({
    this.status,
    this.message,
    this.data,
  });

  factory RequestRegularizationModel.fromJson(Map<String, dynamic> json) =>
      RequestRegularizationModel(
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
  String? id;
  String? userId;
  String? siteId;
  String? userType;
  int? currentDate;
  String? month;
  String? year;
  String? date;
  String? day;
  String? shiftInNumber;
  String? checkIn;
  String? checkInLocation;
  String? checkInQrLocation;
  bool? checkInFaceMatch;
  String? shiftEnd;
  String? attendanceStatus;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? regularizationCheckIn;
  String? regularizationCheckOut;
  String? regularizationStatus;

  Data({
    this.id,
    this.userId,
    this.siteId,
    this.userType,
    this.currentDate,
    this.month,
    this.year,
    this.date,
    this.day,
    this.shiftInNumber,
    this.checkIn,
    this.checkInLocation,
    this.checkInQrLocation,
    this.checkInFaceMatch,
    this.shiftEnd,
    this.attendanceStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.regularizationCheckIn,
    this.regularizationCheckOut,
    this.regularizationStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userId: json["userId"],
        siteId: json["siteId"],
        userType: json["userType"],
        currentDate: json["currentDate"],
        month: json["month"],
        year: json["year"],
        date: json["date"],
        day: json["day"],
        shiftInNumber: json["shiftInNumber"],
        checkIn: json["checkIn"],
        checkInLocation: json["checkInLocation"],
        checkInQrLocation: json["checkInQrLocation"],
        checkInFaceMatch: json["checkInFaceMatch"],
        shiftEnd: json["shiftEnd"],
        attendanceStatus: json["attendanceStatus"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        regularizationCheckIn: json["regularizationCheckIn"],
        regularizationCheckOut: json["regularizationCheckOut"],
        regularizationStatus: json["regularizationStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "siteId": siteId,
        "userType": userType,
        "currentDate": currentDate,
        "month": month,
        "year": year,
        "date": date,
        "day": day,
        "shiftInNumber": shiftInNumber,
        "checkIn": checkIn,
        "checkInLocation": checkInLocation,
        "checkInQrLocation": checkInQrLocation,
        "checkInFaceMatch": checkInFaceMatch,
        "shiftEnd": shiftEnd,
        "attendanceStatus": attendanceStatus,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "regularizationCheckIn": regularizationCheckIn,
        "regularizationCheckOut": regularizationCheckOut,
        "regularizationStatus": regularizationStatus,
      };
}

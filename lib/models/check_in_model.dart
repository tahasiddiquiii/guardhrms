// To parse this JSON data, do
//
//     final checkInModel = checkInModelFromJson(jsonString);

import 'dart:convert';

CheckInModel checkInModelFromJson(String str) =>
    CheckInModel.fromJson(json.decode(str));

String checkInModelToJson(CheckInModel data) => json.encode(data.toJson());

class CheckInModel {
  bool? sucess;
  Message? message;

  CheckInModel({
    this.sucess,
    this.message,
  });

  factory CheckInModel.fromJson(Map<String, dynamic> json) => CheckInModel(
        sucess: json["sucess"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "sucess": sucess,
        "message": message?.toJson(),
      };
}

class Message {
  String? userId;
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
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Message({
    this.userId,
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
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        userId: json["userId"],
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
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
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
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

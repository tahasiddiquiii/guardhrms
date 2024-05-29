// To parse this JSON data, do
//
//     final checkOutModel = checkOutModelFromJson(jsonString);

import 'dart:convert';

CheckOutModel checkOutModelFromJson(String str) =>
    CheckOutModel.fromJson(json.decode(str));

String checkOutModelToJson(CheckOutModel data) => json.encode(data.toJson());

class CheckOutModel {
  bool? sucess;
  Message? message;

  CheckOutModel({
    this.sucess,
    this.message,
  });

  factory CheckOutModel.fromJson(Map<String, dynamic> json) => CheckOutModel(
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
  String? id;
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
  String? createdAt;
  String? updatedAt;
  int? v;
  String? checkOut;
  bool? checkOutFaceMatch;
  String? checkOutLocation;
  String? checkOutQrLocation;

  Message({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.checkOut,
    this.checkOutFaceMatch,
    this.checkOutLocation,
    this.checkOutQrLocation,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
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
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        checkOut: json["checkOut"],
        checkOutFaceMatch: json["checkOutFaceMatch"],
        checkOutLocation: json["checkOutLocation"],
        checkOutQrLocation: json["checkOutQrLocation"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
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
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "checkOut": checkOut,
        "checkOutFaceMatch": checkOutFaceMatch,
        "checkOutLocation": checkOutLocation,
        "checkOutQrLocation": checkOutQrLocation,
      };
}

// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  int? status;
  String? message;
  String? data;
  String? userType;

  VerifyOtpModel({
    this.status,
    this.message,
    this.data,
    this.userType,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
        "userType": userType,
      };
}

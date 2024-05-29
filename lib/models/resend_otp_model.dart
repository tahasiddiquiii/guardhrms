// To parse this JSON data, do
//
//     final resendOtpModel = resendOtpModelFromJson(jsonString);

import 'dart:convert';

ResendOtpModel resendOtpModelFromJson(String str) =>
    ResendOtpModel.fromJson(json.decode(str));

String resendOtpModelToJson(ResendOtpModel data) => json.encode(data.toJson());

class ResendOtpModel {
  String? message;
  String? data;

  ResendOtpModel({
    this.message,
    this.data,
  });

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) => ResendOtpModel(
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data,
      };
}

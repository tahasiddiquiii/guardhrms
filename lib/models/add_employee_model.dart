// To parse this JSON data, do
//
//     final addEmployeeModel = addEmployeeModelFromJson(jsonString);

import 'dart:convert';

AddEmployeeModel addEmployeeModelFromJson(String str) =>
    AddEmployeeModel.fromJson(json.decode(str));

String addEmployeeModelToJson(AddEmployeeModel data) =>
    json.encode(data.toJson());

class AddEmployeeModel {
  int? status;
  String? message;
  Data? data;

  AddEmployeeModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddEmployeeModel.fromJson(Map<String, dynamic> json) =>
      AddEmployeeModel(
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
  String? fullName;
  String? fatherHusbandName;
  String? email;
  String? aadhaar;
  String? bankAccount;
  String? ifscCode;
  String? mobileNumber;
  String? profilePic;
  String? otp;
  DateTime? otpExpiration;
  bool? accountVerification;
  String? status;
  String? userType;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.fullName,
    this.fatherHusbandName,
    this.email,
    this.aadhaar,
    this.bankAccount,
    this.ifscCode,
    this.mobileNumber,
    this.profilePic,
    this.otp,
    this.otpExpiration,
    this.accountVerification,
    this.status,
    this.userType,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullName: json["fullName"],
        fatherHusbandName: json["fatherHusbandName"],
        email: json["email"],
        aadhaar: json["aadhaar"],
        bankAccount: json["bankAccount"],
        ifscCode: json["ifscCode"],
        mobileNumber: json["mobileNumber"],
        profilePic: json["profilePic"],
        otp: json["otp"],
        otpExpiration: json["otpExpiration"] == null
            ? null
            : DateTime.parse(json["otpExpiration"]),
        accountVerification: json["accountVerification"],
        status: json["status"],
        userType: json["userType"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "fatherHusbandName": fatherHusbandName,
        "email": email,
        "aadhaar": aadhaar,
        "bankAccount": bankAccount,
        "ifscCode": ifscCode,
        "mobileNumber": mobileNumber,
        "profilePic": profilePic,
        "otp": otp,
        "otpExpiration": otpExpiration?.toIso8601String(),
        "accountVerification": accountVerification,
        "status": status,
        "userType": userType,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

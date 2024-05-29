// To parse this JSON data, do
//
//     final profileDetailsModel = profileDetailsModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) =>
    ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) =>
    json.encode(data.toJson());

class ProfileDetailsModel {
  int? status;
  String? message;
  Data? data;

  ProfileDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsModel(
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
  String? fullName;
  String? nameDocument;
  String? fatherHusbandName;
  String? fatherHusbandDocument;
  String? email;
  String? emailDocument;
  String? aadhaar;
  String? aadhaarDocument;
  String? bankAccount;
  String? bankAccountDocument;
  String? ifscCode;
  String? ifscCodeDocument;
  String? mobileNumber;
  String? profilePic;
  dynamic otp;
  String? otpExpiration;
  bool? accountVerification;
  String? userType;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? status;

  Data({
    this.id,
    this.fullName,
    this.nameDocument,
    this.fatherHusbandName,
    this.fatherHusbandDocument,
    this.email,
    this.emailDocument,
    this.aadhaar,
    this.aadhaarDocument,
    this.bankAccount,
    this.bankAccountDocument,
    this.ifscCode,
    this.ifscCodeDocument,
    this.mobileNumber,
    this.profilePic,
    this.otp,
    this.otpExpiration,
    this.accountVerification,
    this.userType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        fullName: json["fullName"],
        nameDocument: json["nameDocument"],
        fatherHusbandName: json["fatherHusbandName"],
        fatherHusbandDocument: json["fatherHusbandDocument"],
        email: json["email"],
        emailDocument: json["emailDocument"],
        aadhaar: json["aadhaar"],
        aadhaarDocument: json["aadhaarDocument"],
        bankAccount: json["bankAccount"],
        bankAccountDocument: json["bankAccountDocument"],
        ifscCode: json["ifscCode"],
        ifscCodeDocument: json["ifscCodeDocument"],
        mobileNumber: json["mobileNumber"],
        profilePic: json["profilePic"],
        otp: json["otp"],
        otpExpiration: json["otpExpiration"],
        accountVerification: json["accountVerification"],
        userType: json["userType"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "nameDocument": nameDocument,
        "fatherHusbandName": fatherHusbandName,
        "fatherHusbandDocument": fatherHusbandDocument,
        "email": email,
        "emailDocument": emailDocument,
        "aadhaar": aadhaar,
        "aadhaarDocument": aadhaarDocument,
        "bankAccount": bankAccount,
        "bankAccountDocument": bankAccountDocument,
        "ifscCode": ifscCode,
        "ifscCodeDocument": ifscCodeDocument,
        "mobileNumber": mobileNumber,
        "profilePic": profilePic,
        "otp": otp,
        "otpExpiration": otpExpiration,
        "accountVerification": accountVerification,
        "userType": userType,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "status": status,
      };
}

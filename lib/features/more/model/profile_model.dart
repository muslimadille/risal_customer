// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final int code;
  final bool error;
  final String message;
  final ProfileData payload;

  ProfileModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    payload: ProfileData.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": payload.toJson(),
  };
}

class ProfileData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final dynamic contactPersonName;
  final String contactPersonPhone;
  final String contactPersonEmail;
  final dynamic risalSpPersonName;
  final String risalSpPersonPhone;
  final String risalSpPersonEmail;
  final int sendMail;
  final int firstLogin;
  final int otp;
  final String role;
  final dynamic apiToken;
  final String cr;
  final String address;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.contactPersonName,
    required this.contactPersonPhone,
    required this.contactPersonEmail,
    required this.risalSpPersonName,
    required this.risalSpPersonPhone,
    required this.risalSpPersonEmail,
    required this.sendMail,
    required this.firstLogin,
    required this.otp,
    required this.role,
    required this.apiToken,
    required this.cr,
    required this.address
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json["id"],
    name: json["name"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    contactPersonName: json["contact_person_name"]??"",
    contactPersonPhone: json["contact_person_phone"]??"",
    contactPersonEmail: json["contact_person_email"]??"",
    risalSpPersonName: json["risal_sp_person_name"]??"",
    risalSpPersonPhone: json["risal_sp_person_phone"]??"",
    risalSpPersonEmail: json["risal_sp_person_email"]??"",
    sendMail: json["send_mail"]??"",
    firstLogin: json["first_login"]??"",
    otp: json["otp"]??"",
    role: json["role"]??"",
    apiToken: json["api_token"]??"",
    cr:json["cr"]??"",
    address:json["address"]??""
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "contact_person_name": contactPersonName,
    "contact_person_phone": contactPersonPhone,
    "contact_person_email": contactPersonEmail,
    "risal_sp_person_name": risalSpPersonName,
    "risal_sp_person_phone": risalSpPersonPhone,
    "risal_sp_person_email": risalSpPersonEmail,
    "send_mail": sendMail,
    "first_login": firstLogin,
    "otp": otp,
    "role": role,
    "api_token": apiToken,
  };
}

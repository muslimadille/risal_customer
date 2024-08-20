
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final int code;
  final bool error;
  final dynamic message;
  final Payload payload;

  LoginModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    code: json["code"]??0,
    error: json["error"],
    message: json["message"],
    payload: Payload.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": payload.toJson(),
  };
}

class Payload {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String contactPersonName;
  final String contactPersonPhone;
  final String contactPersonEmail;
  final String risalSpPersonName;
  final String risalSpPersonPhone;
  final String risalSpPersonEmail;
  final int sendMail;
  final int firstLogin;
  final int otp;
  final String role;
  final String apiToken;

  Payload({
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
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"]??-1,
    name: json["name"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    contactPersonName: json["contact_person_name"]??"",
    contactPersonPhone: json["contact_person_phone"]??"",
    contactPersonEmail: json["contact_person_email"]??"",
    risalSpPersonName: json["risal_sp_person_name"]??"",
    risalSpPersonPhone: json["risal_sp_person_phone"]??"",
    risalSpPersonEmail: json["risal_sp_person_email"]??"",
    sendMail: json["send_mail"]??-1,
    firstLogin: json["first_login"]??-1,
    otp: json["otp"]??-1,
    role: json["role"]??"",
    apiToken: json["api_token"]??"",
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

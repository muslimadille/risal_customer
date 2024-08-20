
// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String userName;
  final String token;

  UserModel({
    required this.userName,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userName: json["userName"]??"",
    token: json["token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "token": token,
  };
}

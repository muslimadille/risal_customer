// To parse this JSON data, do
//
//     final requestServicesListModel = requestServicesListModelFromJson(jsonString);

import 'dart:convert';

RequestServicesListModel requestServicesListModelFromJson(String str) => RequestServicesListModel.fromJson(json.decode(str));

String requestServicesListModelToJson(RequestServicesListModel data) => json.encode(data.toJson());

class RequestServicesListModel {
  final int code;
  final bool error;
  final String message;
  final List<RquestServiceModel> payload;

  RequestServicesListModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory RequestServicesListModel.fromJson(Map<String, dynamic> json) => RequestServicesListModel(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    payload: List<RquestServiceModel>.from(json["payload"].map((x) => RquestServiceModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class RquestServiceModel {
  final int id;
  final int serviceId;
  final String title;
  final dynamic service;

  RquestServiceModel({
    required this.id,
    required this.serviceId,
    required this.title,
    required this.service,
  });

  factory RquestServiceModel.fromJson(Map<String, dynamic> json) => RquestServiceModel(
    id: json["id"],
    serviceId: json["service_id"],
    title: json["title"],
    service: json["service"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "title": title,
    "service": service,
  };
}

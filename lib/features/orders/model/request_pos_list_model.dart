// To parse this JSON data, do
//
//     final requestPosListModel = requestPosListModelFromJson(jsonString);

import 'dart:convert';

RequestPosListModel requestPosListModelFromJson(String str) => RequestPosListModel.fromJson(json.decode(str));

String requestPosListModelToJson(RequestPosListModel data) => json.encode(data.toJson());

class RequestPosListModel {
  final int code;
  final bool error;
  final String message;
  final List<RequestPo> payload;

  RequestPosListModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory RequestPosListModel.fromJson(Map<String, dynamic> json) => RequestPosListModel(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    payload: List<RequestPo>.from(json["payload"].map((x) => RequestPo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class RequestPo {
  final int id;
  final String poNumber;

  RequestPo({
    required this.id,
    required this.poNumber,
  });

  factory RequestPo.fromJson(Map<String, dynamic> json) => RequestPo(
    id: json["id"],
    poNumber: json["po_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "po_number": poNumber,
  };
}

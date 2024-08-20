
import 'dart:convert';

PosListModel posListModelFromJson(String str) => PosListModel.fromJson(json.decode(str));

String posListModelToJson(PosListModel data) => json.encode(data.toJson());

class PosListModel {
  final int code;
  final bool error;
  final dynamic message;
  final List<PoModel> payload;

  PosListModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory PosListModel.fromJson(Map<String, dynamic> json) => PosListModel(
    code: json["code"]??-1,
    error: json["error"]??false,
    message: json["message"]??"",
    payload: json["payload"]==null?[]:List<PoModel>.from(json["payload"].map((x) => PoModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class PoModel {
  final int id;
  final String poNumber;
  final num poValue;
  final String status;
  final String isOpenPo;
  final String isAdvancedPayment;
  final num downPaymentValue;

  PoModel({
    required this.id,
    required this.poNumber,
    required this.poValue,
    required this.status,
    required this.isOpenPo,
    required this.isAdvancedPayment,
    required this.downPaymentValue,
  });

  factory PoModel.fromJson(Map<String, dynamic> json) => PoModel(
    id: json["id"]??-1,
    poNumber: json["po_number"]??"",
    poValue: json["po_value"]??-1,
    status: json["status"]??"",
    isOpenPo: json["is_open_po"]??"",
    isAdvancedPayment: json["is_advanced_payment"]??"",
    downPaymentValue: json["down_payment_value"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "po_number": poNumber,
    "po_value": poValue,
    "status": status,
    "is_open_po": isOpenPo,
    "is_advanced_payment": isAdvancedPayment,
    "down_payment_value": downPaymentValue,
  };
}

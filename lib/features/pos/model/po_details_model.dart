// To parse this JSON data, do
//
//     final poDetailsModel = poDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:risal_customer/features/orders/model/orders_list_model.dart';

PoDetailsModel poDetailsModelFromJson(String str) => PoDetailsModel.fromJson(json.decode(str));


class PoDetailsModel {
  final int code;
  final bool error;
  final String message;
  final PoDetailsDataModel payload;

  PoDetailsModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory PoDetailsModel.fromJson(Map<String, dynamic> json) => PoDetailsModel(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    payload: PoDetailsDataModel.fromJson(json["payload"]),
  );


}

class PoDetailsDataModel {
  final int? id;
  final String? poNumber;
  final int? poValue;
  final int? downPaymentValue;
  final int? closeReasonId;
  final String? clientAddress;
  final String? isOpenPo;
  final String? status;
  final String? termsConditions;
  final List<OrderModel>? orders;
  PoDetailsDataModel({
     this.id,
     this.poNumber,
     this.poValue,
     this.downPaymentValue,
     this.closeReasonId,
     this.clientAddress,
     this.isOpenPo,
     this.status,
     this.termsConditions,
     this.orders,
  });

  factory PoDetailsDataModel.fromJson(Map<String, dynamic> json) => PoDetailsDataModel(
    id: json["id"],
    poNumber: json["po_number"]??"",
    poValue: json["po_value"]??0,
    downPaymentValue: json["down_payment_value"]??0,
    clientAddress: json["client_address"],
    isOpenPo: json["is_open_po"]??"",
    status: json["status"]??"",
    termsConditions: json["terms_conditions"],
    orders: json["orders"]==null?[]:List<OrderModel>.from(json["orders"].map((x) => OrderModel.fromJson(x))),
  );


}













class PoClass {
  final int id;
  final String poNumber;
  final int poValue;
  final int downPaymentValue;
  final String termsConditions;
  final String status;
  final String clientAddress;

  PoClass({
    required this.id,
    required this.poNumber,
    required this.poValue,
    required this.downPaymentValue,
    required this.termsConditions,
    required this.status,
    required this.clientAddress,

  });

  factory PoClass.fromJson(Map<String, dynamic> json) => PoClass(
    id: json["id"],
    poNumber: json["po_number"]??"",
    poValue: json["po_value"]??0,
    downPaymentValue: json["down_payment_value"]??0,
    termsConditions: json["terms_conditions"]??"",
    status: json["status"]??"",
    clientAddress: json["client_address"]??"",

  );

}



class Po {
  final int id;
  final String poNumber;
  final int poValue;
  final String status;
  final int downPaymentValue;

  Po({
    required this.id,
    required this.poNumber,
    required this.poValue,
    required this.status,
    required this.downPaymentValue,
  });

  factory Po.fromJson(Map<String, dynamic> json) => Po(
    id: json["id"]??0,
    poNumber: json["po_number"]??"",
    poValue: json["po_value"]??0,
    status: json["status"]??"",
    downPaymentValue: json["down_payment_value"]??0,
  );


}
class Service {
  final int? id;
  final String? name;
  final String? description;
  final String? status;
  final int? typeId;
  final Type type;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.typeId,
    required this.type,
  });

  factory Service.fromJson(Map<String?, dynamic> json) => Service(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    typeId: json["type_id"],
    type: json["type"]??"",
  );


}




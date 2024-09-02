

import 'dart:convert';

import 'package:risal_customer/features/orders/model/order_details_model.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';

OrdersListModel ordersListModelFromJson(String str) => OrdersListModel.fromJson(json.decode(str));


class OrdersListModel {
  final int? code;
  final bool error;
  final String? message;
  final List<OrderModel> payload;

  OrdersListModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory OrdersListModel.fromJson(Map<String?, dynamic> json) => OrdersListModel(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    payload: List<OrderModel>.from(json["payload"].map((x) => OrderModel.fromJson(x))),
  );

}

class OrderModel {
  final int? id;
  final int? poId;
  final int? clientId;
  final int? pOServiceId;
  final int? vehicleId;
  final int? employeeId;
  final dynamic closeReasonId;
  final dynamic order;
  final int? qty;
  final String? date;
  final String? status;
  final String? employeeStatus;
  final dynamic closeReasonText;
  final Service? service;
  final String?duration;
  final PoModel?po;
  final String?generalStatus;


  OrderModel({
    required this.id,
    required this.poId,
    required this.clientId,
    required this.pOServiceId,
    required this.vehicleId,
    required this.employeeId,
    required this.closeReasonId,
    required this.order,
    required this.qty,
    required this.date,
    required this.status,
    required this.employeeStatus,
    required this.closeReasonText,
    required this.service,
    required this.duration,
    required this.po,
    required this.generalStatus
  });

  factory OrderModel.fromJson(Map<String?, dynamic> json) => OrderModel(
    id: json["id"],
    poId: json["po_id"],
    clientId: json["client_id"],
    pOServiceId: json["p_o_service_id"],
    vehicleId: json["vehicle_id"],
    employeeId: json["employee_id"],
    closeReasonId: json["close_reason_id"],
    order: json["order"],
    qty: json["qty"],
    date: json["date"]??"",
    status: json["status"],
    employeeStatus: json["employee_status"],
    closeReasonText: json["close_reason_text"],
    service: Service.fromJson(json["service"]??{}),
    duration: json["duration"].toString(),
    po: PoModel.fromJson(json["po"]),
    generalStatus: json["general_status"]
  );

}





class POService {
  final int? id;
  final int? serviceId;
  final String? title;
  final int? duration;
  final int? qty;
  final int? usedQty;
  final int? price;
  final String? status;
  final int? totalPrice;
  final int? poId;
  final PoModel po;

  POService({
    required this.id,
    required this.serviceId,
    required this.title,
    required this.duration,
    required this.qty,
    required this.usedQty,
    required this.price,
    required this.status,
    required this.totalPrice,
    required this.poId,
    required this.po,
  });

  factory POService.fromJson(Map<String?, dynamic> json) => POService(
    id: json["id"],
    serviceId: json["service_id"],
    title: json["title"],
    duration: json["duration"],
    qty: json["qty"],
    usedQty: json["used_qty"],
    price: json["price"],
    status: json["status"],
    totalPrice: json["total_price"],
    poId: json["po_id"],
    po: PoModel.fromJson(json["po"]??{}),
  );


}











// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));


class OrderDetailsModel {
  final int code;
  final bool error;
  final String message;
  final OrderDetailsDataModel? payload;

  OrderDetailsModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    code: json["code"]??0,
    error: json["error"]??"",
    message: json["message"]??"",
    payload: OrderDetailsDataModel.fromJson(json["payload"]),
  );


}

class OrderDetailsDataModel {
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
  final Client? client;
  final POService? pOService;
  final Client? employee;
  final CloseReason? closeReason;
  final CloseReason? po;



  OrderDetailsDataModel({
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
    required this.po,
    required this.client,
    required this.pOService,
    required this.employee,
    required this.closeReason,
  });

  factory OrderDetailsDataModel.fromJson(Map<String, dynamic> json) => OrderDetailsDataModel(
    id: json["id"]??0,
    poId: json["po_id"]??0,
    clientId: json["client_id"]??0,
    pOServiceId: json["p_o_service_id"]??0,
    vehicleId: json["vehicle_id"]??0,
    employeeId: json["employee_id"]??0,
    closeReasonId: json["close_reason_id"]??0,
    order: json["order"],
    qty: json["qty"]??0,
    date: json["date"]??"",
    status: json["general_status"]??"",
    employeeStatus: json["employee_status"]??"",
    closeReasonText: json["close_reason_text"]??"",
    po: CloseReason.fromJson(json["po"]??{}),
    client: Client.fromJson(json["client"]??{}),
    pOService: POService.fromJson(json["p_o_service"]??{}),
    employee: Client.fromJson(json["employee"]??{}),
    closeReason: CloseReason.fromJson(json["close_reason"]??{}),
  );


}

class Client {
  final int? id;
  final String? name;
  final String? status;
  final String? draft;
  final String? email;
  final String? phone;
  final String? empNumber;
  final dynamic cr;
  final String? department;
  final dynamic contactPersonName;
  final dynamic contactPersonPhone;
  final dynamic contactPersonEmail;
  final dynamic risalSpPersonName;
  final dynamic risalSpPersonPhone;
  final dynamic risalSpPersonEmail;
  final dynamic emailVerifiedAt;
  final String? role;
  final dynamic deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final int? otp;
  final int? sendMail;
  final int? firstLogin;
  final String? apiToken;

  Client({
    required this.id,
    required this.name,
    required this.status,
    required this.draft,
    required this.email,
    required this.phone,
    required this.empNumber,
    required this.cr,
    required this.department,
    required this.contactPersonName,
    required this.contactPersonPhone,
    required this.contactPersonEmail,
    required this.risalSpPersonName,
    required this.risalSpPersonPhone,
    required this.risalSpPersonEmail,
    required this.emailVerifiedAt,
    required this.role,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.otp,
    required this.sendMail,
    required this.firstLogin,
    required this.apiToken,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"]??0,
    name: json["name"]??"",
    status: json["status"]??"",
    draft: json["draft"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    empNumber: json["emp_number"]??"",
    cr: json["cr"],
    department: json["department"]??"",
    contactPersonName: json["contact_person_name"]??"",
    contactPersonPhone: json["contact_person_phone"]??"",
    contactPersonEmail: json["contact_person_email"]??"",
    risalSpPersonName: json["risal_sp_person_name"]??"",
    risalSpPersonPhone: json["risal_sp_person_phone"]??"",
    risalSpPersonEmail: json["risal_sp_person_email"]??"",
    emailVerifiedAt: json["email_verified_at"]??"",
    role: json["role"]??"",
    deletedAt: json["deleted_at"]??"",
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
    otp: json["otp"]??0,
    sendMail: json["send_mail"]??"",
    firstLogin: json["first_login"]??"",
    apiToken: json["api_token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "draft": draft,
    "email": email,
    "phone": phone,
    "emp_number": empNumber,
    "cr": cr,
    "department": department,
    "contact_person_name": contactPersonName,
    "contact_person_phone": contactPersonPhone,
    "contact_person_email": contactPersonEmail,
    "risal_sp_person_name": risalSpPersonName,
    "risal_sp_person_phone": risalSpPersonPhone,
    "risal_sp_person_email": risalSpPersonEmail,
    "email_verified_at": emailVerifiedAt,
    "role": role,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "otp": otp,
    "send_mail": sendMail,
    "first_login": firstLogin,
    "api_token": apiToken,
  };
}

class CloseReason {
  final int? id;
  final String? poNumber;
  final String? jobNumber;
  final int? userId;
  final int? adminId;
  final String? projectName;
  final String? iqNumber;
  final int? poValue;
  final int? downPaymentValue;
  final int? closeReasonId;
  final String? termsConditions;
  final String? closeReasonText;
  final String? statusId;
  final dynamic order;
  final String? isOpenPo;
  final String? isAdvancedPayment;
  final String? status;
  final String? draft;
  final dynamic deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final dynamic areaId;
  final dynamic clientAddress;
  final dynamic googleMapLink;
  final int? isRequested;

  CloseReason({
    required this.id,
    required this.poNumber,
    required this.jobNumber,
    required this.userId,
    required this.adminId,
    required this.projectName,
    required this.iqNumber,
    required this.poValue,
    required this.downPaymentValue,
    required this.closeReasonId,
    required this.termsConditions,
    required this.closeReasonText,
    required this.statusId,
    required this.order,
    required this.isOpenPo,
    required this.isAdvancedPayment,
    required this.status,
    required this.draft,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.areaId,
    required this.clientAddress,
    required this.googleMapLink,
    required this.isRequested,
  });

  factory CloseReason.fromJson(Map<String, dynamic> json) => CloseReason(
    id: json["id"]??0,
    poNumber: json["po_number"],
    jobNumber: json["job_number"],
    userId: json["user_id"],
    adminId: json["admin_id"],
    projectName: json["project_name"],
    iqNumber: json["iq_number"],
    poValue: json["po_value"],
    downPaymentValue: json["down_payment_value"],
    closeReasonId: json["close_reason_id"]??-1,
    termsConditions: json["terms_conditions"]??"",
    closeReasonText: json["close_reason_text"]??"",
    statusId: json["status_id"]??"",
    order: json["order"],
    isOpenPo: json["is_open_po"]??"",
    isAdvancedPayment: json["is_advanced_payment"]??"",
    status: json["status"]??"",
    draft: json["draft"]??"",
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    areaId: json["area_id"],
    clientAddress: json["client_address"],
    googleMapLink: json["google_map_link"],
    isRequested: json["is_requested"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "po_number": poNumber,
    "job_number": jobNumber,
    "user_id": userId,
    "admin_id": adminId,
    "project_name": projectName,
    "iq_number": iqNumber,
    "po_value": poValue,
    "down_payment_value": downPaymentValue,
    "close_reason_id": closeReasonId,
    "terms_conditions": termsConditions,
    "close_reason_text": closeReasonText,
    "status_id": statusId,
    "order": order,
    "is_open_po": isOpenPo,
    "is_advanced_payment": isAdvancedPayment,
    "status": status,
    "draft": draft,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "area_id": areaId,
    "client_address": clientAddress,
    "google_map_link": googleMapLink,
    "is_requested": isRequested,
  };
}

class POService {
  final int? id;
  final int? serviceId;
  final String? title;
  final String? description;
  final int? duration;
  final int? qty;
  final int? usedQty;
  final int? price;
  final String? status;
  final int? totalPrice;
  final int? unitOfMeasureId;
  final int? durationSuffixId;
  final int? poId;
  final dynamic durationSuffix;
  final Po? po;
  final Service? service;

  POService({
    required this.id,
    required this.serviceId,
    required this.title,
    required this.description,
    required this.duration,
    required this.qty,
    required this.usedQty,
    required this.price,
    required this.status,
    required this.totalPrice,
    required this.unitOfMeasureId,
    required this.durationSuffixId,
    required this.poId,
    required this.durationSuffix,
    required this.po,
    required this.service,
  });

  factory POService.fromJson(Map<String, dynamic> json) => POService(
    id: json["id"],
    serviceId: json["service_id"],
    title: json["title"],
    description: json["description"],
    duration: json["duration"],
    qty: json["qty"],
    usedQty: json["used_qty"],
    price: json["price"],
    status: json["status"],
    totalPrice: json["total_price"],
    unitOfMeasureId: json["unit_of_measure_id"],
    durationSuffixId: json["duration_suffix_id"],
    poId: json["po_id"],
    durationSuffix: json["duration_suffix"],
    po: Po.fromJson(json["po"]??{}),
    service: Service.fromJson(json["service"]??{}),
  );

}

class Po {
  final int? id;
  final String? poNumber;
  final int? poValue;
  final String? status;
  final String? isOpenPo;
  final String? isAdvancedPayment;
  final int? downPaymentValue;

  Po({
    required this.id,
    required this.poNumber,
    required this.poValue,
    required this.status,
    required this.isOpenPo,
    required this.isAdvancedPayment,
    required this.downPaymentValue,
  });

  factory Po.fromJson(Map<String, dynamic> json) => Po(
    id: json["id"],
    poNumber: json["po_number"],
    poValue: json["po_value"],
    status: json["status"],
    isOpenPo: json["is_open_po"],
    isAdvancedPayment: json["is_advanced_payment"],
    downPaymentValue: json["down_payment_value"],
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

class Service {
  final int? id;
  final String? name;
  final String? description;
  final String? status;
  final int? typeId;
  final String? type;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.typeId,
    required this.type,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    typeId: json["type_id"],
    type: json["type"]??"",
  );

}







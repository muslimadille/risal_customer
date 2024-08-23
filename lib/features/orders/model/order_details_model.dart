// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final int code;
  final bool error;
  final String message;
  final OrderDetailsDataModel payload;

  OrderDetailsModel({
    required this.code,
    required this.error,
    required this.message,
    required this.payload,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    payload: OrderDetailsDataModel.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": payload.toJson(),
  };
}

class OrderDetailsDataModel {
  final int id;
  final int poId;
  final int clientId;
  final int pOServiceId;
  final int vehicleId;
  final int employeeId;
  final dynamic closeReasonId;
  final dynamic order;
  final int qty;
  final DateTime date;
  final String status;
  final String employeeStatus;
  final dynamic closeReasonText;
  final CloseReason po;
  final Client client;
  final POService pOService;
  final Vehicle vehicle;
  final Client employee;
  final CloseReason closeReason;

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
    required this.vehicle,
    required this.employee,
    required this.closeReason,
  });

  factory OrderDetailsDataModel.fromJson(Map<String, dynamic> json) => OrderDetailsDataModel(
    id: json["id"],
    poId: json["po_id"],
    clientId: json["client_id"],
    pOServiceId: json["p_o_service_id"],
    vehicleId: json["vehicle_id"],
    employeeId: json["employee_id"],
    closeReasonId: json["close_reason_id"],
    order: json["order"],
    qty: json["qty"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
    employeeStatus: json["employee_status"],
    closeReasonText: json["close_reason_text"],
    po: CloseReason.fromJson(json["po"]),
    client: Client.fromJson(json["client"]),
    pOService: POService.fromJson(json["p_o_service"]),
    vehicle: Vehicle.fromJson(json["vehicle"]),
    employee: Client.fromJson(json["employee"]),
    closeReason: CloseReason.fromJson(json["close_reason"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "po_id": poId,
    "client_id": clientId,
    "p_o_service_id": pOServiceId,
    "vehicle_id": vehicleId,
    "employee_id": employeeId,
    "close_reason_id": closeReasonId,
    "order": order,
    "qty": qty,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "status": status,
    "employee_status": employeeStatus,
    "close_reason_text": closeReasonText,
    "po": po.toJson(),
    "client": client.toJson(),
    "p_o_service": pOService.toJson(),
    "vehicle": vehicle.toJson(),
    "employee": employee.toJson(),
    "close_reason": closeReason.toJson(),
  };
}

class Client {
  final int id;
  final String name;
  final String status;
  final String draft;
  final String email;
  final String phone;
  final String empNumber;
  final dynamic cr;
  final String department;
  final dynamic contactPersonName;
  final dynamic contactPersonPhone;
  final dynamic contactPersonEmail;
  final dynamic risalSpPersonName;
  final dynamic risalSpPersonPhone;
  final dynamic risalSpPersonEmail;
  final dynamic emailVerifiedAt;
  final String role;
  final dynamic deletedAt;
  final String createdAt;
  final DateTime updatedAt;
  final int? otp;
  final int sendMail;
  final int firstLogin;
  final dynamic apiToken;

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
    id: json["id"],
    name: json["name"]??"",
    status: json["status"]??"",
    draft: json["draft"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    empNumber: json["emp_number"]??"",
    cr: json["cr"],
    department: json["department"]??"",
    contactPersonName: json["contact_person_name"],
    contactPersonPhone: json["contact_person_phone"],
    contactPersonEmail: json["contact_person_email"],
    risalSpPersonName: json["risal_sp_person_name"],
    risalSpPersonPhone: json["risal_sp_person_phone"],
    risalSpPersonEmail: json["risal_sp_person_email"],
    emailVerifiedAt: json["email_verified_at"],
    role: json["role"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    otp: json["otp"],
    sendMail: json["send_mail"],
    firstLogin: json["first_login"],
    apiToken: json["api_token"],
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
    "updated_at": updatedAt.toIso8601String(),
    "otp": otp,
    "send_mail": sendMail,
    "first_login": firstLogin,
    "api_token": apiToken,
  };
}

class CloseReason {
  final int id;
  final String poNumber;
  final String jobNumber;
  final int userId;
  final int adminId;
  final String projectName;
  final String iqNumber;
  final int poValue;
  final int downPaymentValue;
  final int closeReasonId;
  final String termsConditions;
  final String closeReasonText;
  final String statusId;
  final dynamic order;
  final String isOpenPo;
  final String isAdvancedPayment;
  final String status;
  final String draft;
  final dynamic deletedAt;
  final String createdAt;
  final DateTime updatedAt;
  final dynamic areaId;
  final dynamic clientAddress;
  final dynamic googleMapLink;
  final int isRequested;

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
    id: json["id"],
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
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "updated_at": updatedAt.toIso8601String(),
    "area_id": areaId,
    "client_address": clientAddress,
    "google_map_link": googleMapLink,
    "is_requested": isRequested,
  };
}

class POService {
  final int id;
  final int serviceId;
  final String title;
  final String description;
  final int duration;
  final int qty;
  final int usedQty;
  final int price;
  final String status;
  final int totalPrice;
  final int unitOfMeasureId;
  final int durationSuffixId;
  final int poId;
  final UnitOfMeasure unitOfMeasure;
  final dynamic durationSuffix;
  final Po po;
  final Service service;

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
    required this.unitOfMeasure,
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
    unitOfMeasure: UnitOfMeasure.fromJson(json["unit_of_measure"]),
    durationSuffix: json["duration_suffix"],
    po: Po.fromJson(json["po"]),
    service: Service.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "title": title,
    "description": description,
    "duration": duration,
    "qty": qty,
    "used_qty": usedQty,
    "price": price,
    "status": status,
    "total_price": totalPrice,
    "unit_of_measure_id": unitOfMeasureId,
    "duration_suffix_id": durationSuffixId,
    "po_id": poId,
    "unit_of_measure": unitOfMeasure.toJson(),
    "duration_suffix": durationSuffix,
    "po": po.toJson(),
    "service": service.toJson(),
  };
}

class Po {
  final int id;
  final String poNumber;
  final int poValue;
  final String status;
  final String isOpenPo;
  final String isAdvancedPayment;
  final int downPaymentValue;

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
  final int id;
  final String name;
  final String description;
  final String status;
  final int typeId;
  final Type type;

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
    type: Type.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
    "type_id": typeId,
    "type": type.toJson(),
  };
}

class Type {
  final String nameAr;
  final String nameEn;

  Type({
    required this.nameAr,
    required this.nameEn,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "name_ar": nameAr,
    "name_en": nameEn,
  };
}

class UnitOfMeasure {
  final int id;
  final String nameAr;
  final String nameEn;
  final dynamic sort;
  final String isDefault;
  final String status;
  final dynamic hasOther;
  final int parentId;
  final dynamic deletedAt;
  final String createdAt;
  final DateTime updatedAt;

  UnitOfMeasure({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.sort,
    required this.isDefault,
    required this.status,
    required this.hasOther,
    required this.parentId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UnitOfMeasure.fromJson(Map<String, dynamic> json) => UnitOfMeasure(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    sort: json["sort"],
    isDefault: json["is_default"],
    status: json["status"],
    hasOther: json["has_other"],
    parentId: json["parent_id"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "sort": sort,
    "is_default": isDefault,
    "status": status,
    "has_other": hasOther,
    "parent_id": parentId,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Vehicle {
  final int id;
  final String number;
  final dynamic order;
  final String status;
  final String draft;
  final dynamic deletedAt;
  final String createdAt;
  final DateTime updatedAt;

  Vehicle({
    required this.id,
    required this.number,
    required this.order,
    required this.status,
    required this.draft,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    number: json["number"],
    order: json["order"],
    status: json["status"],
    draft: json["draft"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "order": order,
    "status": status,
    "draft": draft,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}

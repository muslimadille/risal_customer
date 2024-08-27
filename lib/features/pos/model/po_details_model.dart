// To parse this JSON data, do
//
//     final poDetailsModel = poDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:risal_customer/features/orders/model/orders_list_model.dart';

PoDetailsModel poDetailsModelFromJson(String str) => PoDetailsModel.fromJson(json.decode(str));

String poDetailsModelToJson(PoDetailsModel data) => json.encode(data.toJson());

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

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "payload": payload.toJson(),
  };
}

class PoDetailsDataModel {
  final int? id;
  final String? poNumber;
  final int? poValue;
  final IsAdvancedPayment? isAdvancedPayment;
  final int? downPaymentValue;
  final int? closeReasonId;
  //final CloseReasonText closeReasonText;
  final dynamic clientAddress;
  final String? isOpenPo;
  final String? status;
  final dynamic googleMapLink;
  final String? termsConditions;
  final UnitOfMeasureClass? closeReason;
  final List<Order>? orders;

  PoDetailsDataModel({
     this.id,
     this.poNumber,
     this.poValue,
     this.isAdvancedPayment,
     this.downPaymentValue,
     this.closeReasonId,
    //required this.closeReasonText,
     this.clientAddress,
     this.isOpenPo,
     this.status,
     this.googleMapLink,
     this.termsConditions,
     this.closeReason,
     this.orders,
  });

  factory PoDetailsDataModel.fromJson(Map<String, dynamic> json) => PoDetailsDataModel(
    id: json["id"],
    poNumber: json["po_number"]??"",
    poValue: json["po_value"]??0,
    isAdvancedPayment: isAdvancedPaymentValues.map[json["is_advanced_payment"]]!,
    downPaymentValue: json["down_payment_value"]??0,
    closeReasonId: json["close_reason_id"]??0,
    //closeReasonText: closeReasonTextValues.map[json["close_reason_text"]??""]!,
    clientAddress: json["client_address"],
    isOpenPo: json["is_open_po"]??"",
    status: json["status"]??"",
    googleMapLink: json["google_map_link"]??"",
    termsConditions: json["terms_conditions"],
    closeReason: json["close_reason"]!=null?UnitOfMeasureClass.fromJson(json["close_reason"]):null,
    orders: json["orders"]==null?[]:List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "po_number": poNumber,
    "po_value": poValue,
    "is_advanced_payment": isAdvancedPaymentValues.reverse[isAdvancedPayment],
    "down_payment_value": downPaymentValue,
    "close_reason_id": closeReasonId,
    //"close_reason_text": closeReasonTextValues.reverse[closeReasonText],
    "client_address": clientAddress,
    "is_open_po": isOpenPoValues.reverse[isOpenPo],
    "status": status,
    "google_map_link": googleMapLink,
    "terms_conditions": termsConditions,
    "close_reason": closeReason!.toJson(),
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}

class UnitOfMeasureClass {
  final int id;
  final String nameAr;
  final String nameEn;
  final dynamic sort;
  final String isDefault;
  final String status;
  final dynamic hasOther;
  final int parentId;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;

  UnitOfMeasureClass({
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

  factory UnitOfMeasureClass.fromJson(Map<String, dynamic> json) => UnitOfMeasureClass(
    id: json["id"]??0,
    nameAr: json["name_ar"]??"",
    nameEn: json["name_en"]??"",
    sort: json["sort"]??"",
    isDefault: json["is_default"]??"",
    status: json["status"]??"",
    hasOther: json["has_other"]??"",
    parentId: json["parent_id"]??0,
    deletedAt: json["deleted_at"]??"",
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
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
    "updated_at": updatedAt,
  };
}

enum UnitOfMeasureStatus {
  ACTIVE
}

final unitOfMeasureStatusValues = EnumValues({
  "active": UnitOfMeasureStatus.ACTIVE
});

enum CloseReasonText {
  DSD
}

final closeReasonTextValues = EnumValues({
  "dsd": CloseReasonText.DSD
});

enum IsAdvancedPayment {
  NO
}

final isAdvancedPaymentValues = EnumValues({
  "no": IsAdvancedPayment.NO
});

enum IsOpenPo {
  YES
}

final isOpenPoValues = EnumValues({
  "yes": IsOpenPo.YES
});

class Order {
  final int id;
  final int poId;
  final int? clientId;
  final int pOServiceId;
  final int vehicleId;
  final int employeeId;
  final dynamic closeReasonId;
  final int? order;
  final int qty;
  final DateTime date;
  final String status;
  final String employeeStatus;
  final dynamic closeReasonText;
  final PoClass po;
  final Employee? client;
  final POService pOService;
  final Vehicle vehicle;
  final Employee employee;
  final PoClass closeReason;

  Order({
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

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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
    po: PoClass.fromJson(json["po"]),
    client: json["client"] == null ? null : Employee.fromJson(json["client"]),
    pOService: POService.fromJson(json["p_o_service"]??{}),
    vehicle: Vehicle.fromJson(json["vehicle"]??{}),
    employee: Employee.fromJson(json["employee"]??{}),
    closeReason: PoClass.fromJson(json["close_reason"]??{}),
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
    "client": client?.toJson(),
    "p_o_service": pOService.toJson(),
    "vehicle": vehicle.toJson(),
    "employee": employee.toJson(),
    "close_reason": closeReason.toJson(),
  };
}

class Employee {
  final int id;
  final String name;
  final String status;
  final String draft;
  final String email;
  final String phone;
  final String empNumber;
  final String cr;
  final String department;
  final String contactPersonName;
  final String contactPersonPhone;
  final String contactPersonEmail;
  final String risalSpPersonName;
  final String risalSpPersonPhone;
  final String risalSpPersonEmail;
  final String emailVerifiedAt;
  final String role;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final int? otp;
  final int sendMail;
  final int firstLogin;
  final String apiToken;

  Employee({
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

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"]??"",
    status: json["status"]??"",
    draft: json["draft"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    empNumber: json["emp_number"]??"",
    cr: json["cr"]??"",
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
    sendMail: json["send_mail"]??0,
    firstLogin: json["first_login"]??0,
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


class PoClass {
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
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final dynamic areaId;
  final String clientAddress;
  final String googleMapLink;
  final int isRequested;

  PoClass({
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

  factory PoClass.fromJson(Map<String, dynamic> json) => PoClass(
    id: json["id"],
    poNumber: json["po_number"]??"",
    jobNumber: json["job_number"]??"",
    userId: json["user_id"]??0,
    adminId: json["admin_id"]??0,
    projectName: json["project_name"]??"",
    iqNumber: json["iq_number"]??"",
    poValue: json["po_value"]??0,
    downPaymentValue: json["down_payment_value"]??0,
    closeReasonId: json["close_reason_id"]??0,
    termsConditions: json["terms_conditions"]??"",
    closeReasonText: json["close_reason_text"]??"",
    statusId: json["status_id"]??"",
    order: json["order"],
    isOpenPo: json["is_open_po"]??"",
    isAdvancedPayment: json["is_advanced_payment"]??"",
    status: json["status"]??"",
    draft: json["draft"]??"",
    deletedAt: json["deleted_at"]??"",
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
    areaId: json["area_id"]??'',
    clientAddress: json["client_address"]??"",
    googleMapLink: json["google_map_link"]??"",
    isRequested: json["is_requested"]??0,
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
    "close_reason_text": closeReasonTextValues.reverse[closeReasonText],
    "status_id": statusId,
    "order": order,
    "is_open_po": isOpenPoValues.reverse[isOpenPo],
    "is_advanced_payment": isAdvancedPaymentValues.reverse[isAdvancedPayment],
    "status": unitOfMeasureStatusValues.reverse[status],
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
  final UnitOfMeasureClass unitOfMeasure;
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
    id: json["id"]??0,
    serviceId: json["service_id"]??0,
    title: json["title"]??"",
    description: json["description"]??"",
    duration: json["duration"]??0,
    qty: json["qty"]??0,
    usedQty: json["used_qty"]??0,
    price: json["price"]??0,
    status: json["status"]??"",
    totalPrice: json["total_price"]??0,
    unitOfMeasureId: json["unit_of_measure_id"]??0,
    durationSuffixId: json["duration_suffix_id"]??0,
    poId: json["po_id"]??0,
    unitOfMeasure: UnitOfMeasureClass.fromJson(json["unit_of_measure"]??{}),
    durationSuffix: json["duration_suffix"]??"",
    po: Po.fromJson(json["po"]??{}),
    service: Service.fromJson(json["service"]??{}),
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
    "status": unitOfMeasureStatusValues.reverse[status],
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
    id: json["id"]??0,
    poNumber: json["po_number"]??"",
    poValue: json["po_value"]??0,
    status: json["status"]??"",
    isOpenPo: json["is_open_po"]??"",
    isAdvancedPayment:json["is_advanced_payment"]??"",
    downPaymentValue: json["down_payment_value"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "po_number": poNumber,
    "po_value": poValue,
    "status": status,
    "is_open_po": isOpenPoValues.reverse[isOpenPo],
    "is_advanced_payment": isAdvancedPaymentValues.reverse[isAdvancedPayment],
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
    id: json["id"]??0,
    name: json["name"]??"",
    description: json["description"]??"",
    status: json["status"]??"",
    typeId: json["type_id"]??0,
    type: Type.fromJson(json["type"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": unitOfMeasureStatusValues.reverse[status],
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
    nameAr: json["name_ar"]??"",
    nameEn: json["name_en"]??"",
  );

  Map<String, dynamic> toJson() => {
    "name_ar": nameAr,
    "name_en": nameEn,
  };
}

class Vehicle {
  final int id;
  final String number;
  final dynamic order;
  final String status;
  final String draft;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;

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
    number: json["number"]??"",
    order: json["order"],
    status: json["status"]??"",
    draft: json["draft"]??"",
    deletedAt: json["deleted_at"]??"",
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "order": order,
    "status": status,
    "draft": draft,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

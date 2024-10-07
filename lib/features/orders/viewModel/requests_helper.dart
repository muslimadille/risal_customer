
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/widgets/custom_snakbar.dart';
import 'package:risal_customer/features/orders/model/orders_list_model.dart';
import 'package:risal_customer/features/orders/model/request_services_list_model.dart';
import 'package:risal_customer/features/orders/repo/orders_repo.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/repo/pos_repo.dart';
import 'package:intl/intl.dart';

import '../model/request_pos_list_model.dart';


mixin RequestsHelper{
  int currentPage=1;
  late Map<String,dynamic>posListFilters;
  final OrdersRepo ordersRepo=OrdersRepo();

  late final StreamController<List<RequestPo>> posListState;
  late final StreamController<List<RquestServiceModel>> servicesListState;
  List<OrderModel>posList=[];

  late final StreamController<List<OrderModel>> requestsListState;



  onInit(){
    posListFilters={
      "page":currentPage,
      "per_page":"20",
      "status[0]":null,//active,closed
      "date":null,
      "service_id":null,//yes,no
    };
    posListState = StreamController<List<RequestPo>>.broadcast();
    servicesListState=StreamController<List<RquestServiceModel>>.broadcast();
    requestsListState=StreamController<List<OrderModel>>();
    getRequestsList();
    getPosList();
    //getServicesList(1);
  }
  onDispose(){
    posListState.close();
  }
  getRequestsList({int? page})async{
    try{
      final response=await ordersRepo.getRequestsList();
      OrdersListModel ordersListModel = ordersListModelFromJson(jsonEncode(response.data));
      if(currentPage==1){
        posList.clear();
      }
      posList.addAll(ordersListModel.payload);
      requestsListState.add(posList);

    }catch (error) {
      rethrow;
    }

  }
  getServices()async{
    try{
      final response=await ordersRepo.getAllServices();
    }catch (error) {
      rethrow;
    }
  }
  Future<void> onDateOfBirthClickAndroid() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? picked = await showDatePicker(
        context: AppNavigator().currentContext(),
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2100, 8));
    if (picked != null) {
      DateTime now = picked;
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);
      posListFilters["date"]=formattedDate;
    }
  }
  getPosList()async{
    try{
      final response=await ordersRepo.getRequestPos();
      RequestPosListModel requestPosListModel = requestPosListModelFromJson(jsonEncode(response.data));

      posListState.add(requestPosListModel.payload);

    }catch (error) {
      rethrow;
    }

  }
  getServicesList(int id)async{
    try{
      final response=await ordersRepo.getRequestServices(poId: id);
      RequestServicesListModel requestServicesListModel = requestServicesListModelFromJson(jsonEncode(response.data));
      servicesListState.add(requestServicesListModel.payload);
    }catch (error) {
      rethrow;
    }

  }
  addRequest(Map<String,dynamic>data)async{
    try{
      final response=await ordersRepo.setRequest(data);
      CustomSnakbar().appSnackBar(text: response.data["message"]);
      getRequestsList();
    }catch (error) {
      rethrow;
    }

  }
}
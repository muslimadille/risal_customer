
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/features/orders/model/orders_list_model.dart';
import 'package:risal_customer/features/orders/repo/orders_repo.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/repo/pos_repo.dart';
import 'package:intl/intl.dart';


mixin OrdersListHelper{
  int currentPage=1;
  late Map<String,dynamic>posListFilters;
  final OrdersRepo ordersRepo=OrdersRepo();
  List<OrderModel>posList=[];

  late final StreamController<List<OrderModel>> posListState;


  onInit(){
    posListFilters={
      "page":currentPage,
      "per_page":"20",
      "status[0]":null,//active,closed
      "date":null,
      "service_id":null,//yes,no
    };
    posListState = StreamController<List<OrderModel>>();
    getPosList();
    getServices();
  }
  onDispose(){
    posListState.close();
  }
  getPosList({int? page})async{
    try{
      final response=await ordersRepo.getOrdersList(posListFilters);
      OrdersListModel ordersListModel = ordersListModelFromJson(jsonEncode(response.data));
      if(currentPage==1){
        posList.clear();
      }
      posList.addAll(ordersListModel.payload);
      posListState.add(posList);

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
}
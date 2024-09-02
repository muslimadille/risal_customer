
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:risal_customer/features/orders/model/orders_list_model.dart';
import 'package:risal_customer/features/orders/repo/orders_repo.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/repo/pos_repo.dart';

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
      "status":null,//active,closed
      "date":null,
      "service_id":null,//yes,no
      "is_advanced_payment":null,//yes,no
    };
    posListState = StreamController<List<OrderModel>>();
    getPosList();
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
}
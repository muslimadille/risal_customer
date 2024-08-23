
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/repo/pos_repo.dart';

mixin PosListHelper{
  int currentPage=1;
  late Map<String,dynamic>posListFilters;
  final PosRepo posRepo=PosRepo();
  List<PoModel>posList=[];

  late final StreamController<List<PoModel>> posListState;


  onInit(){
    posListFilters={
      "page":currentPage,
      "per_page":"20",
      "status":null,//active,closed
      "po_number":null,
      "is_open_po":null,//yes,no
      "is_advanced_payment":null,//yes,no
    };
    posListState = StreamController<List<PoModel>>();
    getPosList();
  }
  onDispose(){
    posListState.close();
  }
  getPosList({int? page})async{
    try{
      final response=await posRepo.getPosList(posListFilters);
      PosListModel posListModel = posListModelFromJson(jsonEncode(response.data));
      if(currentPage==1){
        posList.clear();
      }
      posList.addAll(posListModel.payload);
      posListState.add(posList);

    }catch (error) {
      rethrow;
    }

  }
}
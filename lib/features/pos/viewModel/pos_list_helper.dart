
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/repo/pos_repo.dart';

mixin PosListHelper{
  int currentPage=1;
  final PosRepo posRepo=PosRepo();
  List<PoModel>posList=[];
  late final ValueNotifier<List<PoModel>> posListState;


  onInit(){
    posListState = ValueNotifier<List<PoModel>>([]);
    getPosList();
  }
  onDispose(){
    posListState.dispose();
  }
  getPosList({int? page})async{
    try{
      final response=await posRepo.getPosList(currentPage);
      PosListModel posListModel = posListModelFromJson(jsonEncode(response.data));
      if(currentPage==1){
        posList.clear();
      }
      posList.addAll(posListModel.payload);
      posListState.value=posList;

    }catch (error) {
      rethrow;
    }

  }
}
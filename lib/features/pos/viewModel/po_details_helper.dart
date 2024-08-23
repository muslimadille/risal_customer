import 'dart:async';
import 'dart:convert';

import 'package:risal_customer/features/pos/model/po_details_model.dart';
import 'package:risal_customer/features/pos/repo/pos_repo.dart';

mixin PoDetailsHelper{
  PosRepo repo=PosRepo();
  int opId=-1;
  late final StreamController<PoDetailsDataModel?> detailsController;
  onInit(){
    detailsController=StreamController<PoDetailsDataModel?>();
    getOpDetails();
  }
  onDispose(){
    detailsController.close();
  }
  getOpDetails()async{
    try{
      final response=await repo.getPoDetails(id: opId);
      PoDetailsModel poDetailsModel = poDetailsModelFromJson(jsonEncode(response.data));
      detailsController.add(poDetailsModel.payload);
    }catch (error) {
      rethrow;
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:risal_customer/features/orders/model/order_details_model.dart';
import 'package:risal_customer/features/orders/repo/orders_repo.dart';


mixin OrderDetailsHelper{
  OrdersRepo repo=OrdersRepo();
  late final  int orderId;
  late final StreamController<OrderDetailsDataModel?> detailsController;
  onInit(){
    detailsController=StreamController<OrderDetailsDataModel?>();
    getOpDetails();
  }
  onDispose(){
    detailsController.close();
  }
  getOpDetails()async{
    try{
      final response=await repo.getOrderDetails(id: orderId);
      OrderDetailsModel orderDetailsModel = orderDetailsModelFromJson(jsonEncode(response.data));
      detailsController.add(orderDetailsModel.payload);
    }catch (error) {
      rethrow;
    }
  }
  receiveOrder()async{
    try{
      final response=await repo.receiveOrder(id: orderId);
      getOpDetails();
    }catch (error) {
      rethrow;
    }
  }
}
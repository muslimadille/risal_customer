import 'package:dio/dio.dart';
import 'package:risal_customer/common/helpers/network_helper/api_codes.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_exception_model.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_request_enum.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_request_model.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';

class OrdersRepo{
  Future<Response>getOrdersList(Map<String,dynamic>body)async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ORDERS_LIST,
            networkType: NetworkRequestEnum.post,
            data:body,
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getOrderDetails({required  int id})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ORDERS_DETAILS+id.toString(),
            networkType: NetworkRequestEnum.get,
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>receiveOrder({required  int id})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.REVIEVE_ORDER+id.toString(),
            networkType: NetworkRequestEnum.get,
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>reportIssue({required  String title,required  message})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.REPORT_ISSUE,
            networkType: NetworkRequestEnum.get,
            data: {
              "title":title,
              "message":message
            },
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getAllServices()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ALL_SERVICES,
            networkType: NetworkRequestEnum.get,
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }


}
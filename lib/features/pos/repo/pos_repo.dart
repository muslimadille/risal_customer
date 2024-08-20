import 'package:dio/dio.dart';
import 'package:risal_customer/common/helpers/network_helper/api_codes.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_exception_model.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_request_enum.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_request_model.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';

class PosRepo{
  Future<Response>getPosList(int page,{
    int?per_page,
    String?status,
    String?po_number,
    String?is_open_po,
    String?is_advanced_payment
  })async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_POS_LIST_,
            networkType: NetworkRequestEnum.post,
            data:{
              "page":page,
              "per_page":per_page??"20",
              "status":status,//active,closed
              "po_number":po_number,
              "is_open_po":is_open_po,//yes,no
              "is_advanced_payment":is_advanced_payment,//yes,no
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

}
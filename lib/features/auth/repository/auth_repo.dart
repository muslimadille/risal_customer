import 'package:dio/dio.dart';
import 'package:risal_customer/common/helpers/network_helper/api_codes.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_request_model.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';

import '../../../common/helpers/network_helper/models/network_exception_model.dart';
import '../../../common/helpers/network_helper/models/network_request_enum.dart';

class AuthRepo{
  Future<Response>login({required String password,required String email})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.LOGIN_API,
            networkType: NetworkRequestEnum.post,
            data: {
              "password":password,
              "email":email
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
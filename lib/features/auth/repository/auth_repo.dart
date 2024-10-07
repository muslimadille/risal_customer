import 'package:dio/dio.dart';
import 'package:risal_customer/common/helpers/network_helper/api_codes.dart';
import 'package:risal_customer/common/helpers/network_helper/models/network_request_model.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';
import 'package:risal_customer/common/helpers/notification_hadler.dart';
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
              "email":email,
              "fcm_token":NotificationHandle().fcmToken
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
  Future<Response>editPassword({required String oldPassword,required String newPassword,required String confirmPassword})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.UPDATE_PASSWORD,
            networkType: NetworkRequestEnum.post,
            data: {
              "old_password":oldPassword,
              "password":newPassword,
              "password_confirmation":confirmPassword
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
  Future<Response>setPassword({required String newPassword,required String confirmPassword})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.SET_PASSWORD_API,
            networkType: NetworkRequestEnum.post,
            data: {
              "password":newPassword,
              "password_confirmation":confirmPassword
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
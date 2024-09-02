import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/helpers/network_helper/api_codes.dart';
import '../../widgets/custom_snakbar.dart';
import 'models/network_exception_model.dart';
import 'models/network_request_enum.dart';
import 'models/network_request_model.dart';
import 'network_exception_handler.dart';


class NetworkRequest with NetworkExceptionHandler {
  static NetworkRequest? _instance;

  NetworkRequest._internal();

  factory NetworkRequest() {
    _instance = _instance ?? NetworkRequest._internal();
    return _instance!;
  }

  Dio dio = Dio(BaseOptions(
    baseUrl: ApiCodes.BASE_URL,
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    connectTimeout: const Duration(seconds: 60),
  ));

  bool canBack = true;
  bool canMakeRequest = true;
  bool isInNewTokenProcess = false;


  Future sendAppRequest(

      {required NetworkRequestModel networkParameters,
      required NetworkExceptionModel exceptionParameters}) async {

    //dio.options.headers['App-Language'] = isArabic ? "ar" : "en";

    if (canMakeRequest) {
      if (networkParameters.showProgress??false) {
        EasyLoading.show();
      }

      if ((networkParameters.showProgress??false) || (networkParameters.dismissProgress??false)) {
        canBack = false;
      }

      log("******Request************(serviceId:${networkParameters.apiCode})"
      "\nheader : ${networkParameters.header.toString()}"
          "\ndata : ${networkParameters.data != null &&!(networkParameters.data is FormData) ? json.encode(networkParameters.data) : {}}"
          "\nqueryParameters : ${networkParameters.queryParameters != null ? json.encode(networkParameters.queryParameters) : {}}\n");
      try {
        final Response response = await dio.request(
          networkParameters.apiCode,
          queryParameters: networkParameters.queryParameters,
          data: networkParameters.data,
          options: Options(
            sendTimeout: Duration(seconds: 120),
              receiveTimeout:Duration(seconds: 120) ,
              headers: networkParameters.header,
              method: networkParameters.networkType!=null?networkParameters.networkType!.name.toUpperCase():NetworkRequestEnum.get.name),
        );

        log("******Response************(serviceId:${networkParameters.apiCode})\n${response}");

        if (networkParameters.dismissProgress??false) {
          EasyLoading.dismiss();
          canBack = true;
        }
        if(response.data["status"].toString()=="0"&&(exceptionParameters.showError??false)){
          CustomSnakbar().appSnackBar(text:response.data["message"].toString() , isFaild: true);
        }
        return response;
      } on DioException catch (dioError) {
        log("******Error************(serviceId:${networkParameters.apiCode})*****(statusCode:${dioError.response?.statusCode}:${dioError.response?.statusMessage})\n${dioError.response}");
        isInNewTokenProcess=false;
        if (exceptionParameters.dismissProgress??false) {
          EasyLoading.dismiss();
          canBack = true;
        }

        final String? errorMessage = dioErrorHandler(
            dioError: dioError, exceptionModel: exceptionParameters);
        if ((exceptionParameters.showError??false) && errorMessage != null) {
          canMakeRequest = false;
          CustomSnakbar().hideSnackbar();
          CustomSnakbar().appSnackBar(text: dioError.response!=null?dioError.response!.data['message'].toString():errorMessage, isFaild: true);
          Future.delayed(const Duration(seconds: 3), () {
            canMakeRequest = true;
          });
        }

        if (networkParameters.rethrowError??false) {
          rethrow;
        }
        log("******Error************(serviceId:${networkParameters.apiCode})\nError Message :${errorMessage}\nStatus code :${dioError.response?.statusCode ?? 0}\n${jsonEncode(dioError.response?.data ?? {})}");
      }
    }
  }

}

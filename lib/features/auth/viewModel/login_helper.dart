import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/features/auth/model/login_model.dart';
import 'package:risal_customer/features/auth/model/user_model.dart';
import 'package:risal_customer/features/auth/repository/auth_repo.dart';

mixin LoginHelper{
  final AuthRepo authRepo=AuthRepo();
  late final  TextEditingController emailController;
  late final  TextEditingController passwordController;
  late final ValueNotifier<bool> loginButtonState;
  late final GlobalKey<FormState> formKey;



  onInit(){
    emailController=TextEditingController();
    passwordController=TextEditingController();
    loginButtonState = ValueNotifier<bool>(false);
    formKey=GlobalKey<FormState>();
  }
  onDispose(){
    emailController.dispose();
    passwordController.dispose();
    loginButtonState.dispose();
  }
  checkLoginButtonState(){
    loginButtonState.value=emailController.text.isNotEmpty&&passwordController.text.isNotEmpty;
  }

  onTermsClick(){
    AppNavigator().push(routeName: AppRoutes.CONFIRM_EMAIL_SCREEN_ROUTE);
  }
  onLoginClick()async{
    try{
      final response=await authRepo.login(
          password: '1111qqqq',
          email: "mobile@test.com");
      LoginModel loginModel = loginModelFromJson(jsonEncode(response.data));
      NetworkRequest().dio.options.headers['Authorization'] = "Bearer ${loginModel.payload.apiToken}";
        if(loginModel.payload.firstLogin==1){
          AppNavigator().push(routeName: AppRoutes.CHANGE_PASSWORD_SCREEN_ROUTE);
        }else{
          AppNavigator().push(routeName: AppRoutes.HOME_TABS_SCREEN_ROUTE);
        }
    }catch (error) {
      rethrow;
    }


  }
}
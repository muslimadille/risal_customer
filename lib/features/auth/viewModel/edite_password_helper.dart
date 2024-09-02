import 'dart:async';

import 'package:flutter/material.dart';
import 'package:risal_customer/common/extension/validators_extension.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/utils/storage_keys.dart';

import '../../../common/helpers/local_storage.dart';
import '../repository/auth_repo.dart';

mixin  EditePasswordHelper{
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  late final GlobalKey<FormState> formKey;
  late final StreamController<bool>buttonController;


  onInit(){
    oldPasswordController=TextEditingController();
    newPasswordController=TextEditingController();
    confirmPasswordController=TextEditingController();
    buttonController=StreamController<bool>()..add(false);
    formKey=GlobalKey<FormState>();
  }
  onDispose(){
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    buttonController.close();
  }

  updateButtonState(){
    bool state=oldPasswordController.text.isNotEmpty&&
        newPasswordController.text.isNotEmpty&&
        confirmPasswordController.text.isNotEmpty;
    buttonController.add(state);
  }
  editePassword()async{
    if(formKey.currentState!.validate()){
      try{
        final response=await AuthRepo().editPassword(
            oldPassword: oldPasswordController.text,
            newPassword: newPasswordController.text,
        confirmPassword:confirmPasswordController.text );
        LocalStorage().putInBox(key: StorageKeys.TOKEN, value: "");
        NetworkRequest().dio.options.headers['Authorization'] = "";
        AppNavigator().pushAndRemoveAll(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
      }catch (error) {
        rethrow;
      }
    }

  }

}
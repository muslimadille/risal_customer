import 'dart:async';

import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_routes.dart';

import '../repository/auth_repo.dart';

mixin SetPasswordHelper{
  final AuthRepo authRepo=AuthRepo();
  late final  TextEditingController confirmPasswordController;
  late final  TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;
  late final StreamController<bool>buttonController;

  onInit(){
    confirmPasswordController=TextEditingController();
    passwordController=TextEditingController();
    formKey=GlobalKey<FormState>();
    buttonController=StreamController<bool>();
    buttonController.add(false);
  }
  updateButtonState(){
    buttonController.add(confirmPasswordController.text.isNotEmpty&&passwordController.text.isNotEmpty);
  }
  onDispose(){
    confirmPasswordController.dispose();
    passwordController.dispose();
  }
  setPassword()async{
    if(formKey.currentState!.validate()){}
    try{
      final response=await authRepo.setPassword(
          newPassword:passwordController.text,
          confirmPassword: confirmPasswordController.text);
      AppNavigator().pushAndRemoveAll(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
    }catch (error) {
      rethrow;
    }
  }
}
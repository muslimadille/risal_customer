import 'dart:async';
import 'dart:convert';

import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/helpers/local_storage.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/utils/storage_keys.dart';
import 'package:risal_customer/features/more/model/profile_model.dart';
import 'package:risal_customer/features/more/repo/more_repo.dart';

mixin MoreScreenHelper{
  final MoreRepo moreRepo=MoreRepo();
  late final StreamController<ProfileData>profileController;
onInit()async{
  profileController=StreamController<ProfileData>();
  await getProfileData();
}
onDispose(){
  profileController.close();
}

getProfileData()async{
  try{
    final response=await moreRepo.getProfileData();
    ProfileModel profileModel = profileModelFromJson(jsonEncode(response.data));
    profileController.add(profileModel.payload);
  }catch (error) {
    rethrow;
  }

}
logout(){
  LocalStorage().putInBox(key: StorageKeys.TOKEN, value:"");
  NetworkRequest().dio.options.headers['Authorization'] = "";
  AppNavigator().pushAndRemoveAll(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
}
}
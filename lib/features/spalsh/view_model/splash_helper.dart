import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/helpers/local_storage.dart';
import 'package:risal_customer/common/helpers/network_helper/network_request.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/utils/storage_keys.dart';

mixin SplashHelper{
  navigate()async{
    Future.delayed(Duration(seconds: 1)).then((value) async{
      String? token= await LocalStorage().getFromBox(key: StorageKeys.TOKEN);
      if((token??"").isNotEmpty){
        NetworkRequest().dio.options.headers['Authorization'] = "Bearer ${token}";
        AppNavigator().pushReplacement(routeName: AppRoutes.HOME_TABS_SCREEN_ROUTE);
      }else{
        AppNavigator().pushReplacement(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
      }
    });

  }
}
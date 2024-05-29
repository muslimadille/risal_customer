import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_routes.dart';

mixin SplashHelper{
  navigate()async{
    Future.delayed(Duration(seconds: 4)).then((value) {
      AppNavigator().pushReplacement(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
    });

  }
}
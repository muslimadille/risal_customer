import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_routes.dart';

mixin LoginHelper{
  onTermsClick(){
    AppNavigator().push(routeName: AppRoutes.FORGET_PASSWORD_SCREEN_ROUTE);
  }
}
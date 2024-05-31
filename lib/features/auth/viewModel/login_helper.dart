import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_routes.dart';

mixin LoginHelper{
  onTermsClick(){
    AppNavigator().push(routeName: AppRoutes.CONFIRM_EMAIL_SCREEN_ROUTE);
  }
  onLoginClick(){
    AppNavigator().push(routeName: AppRoutes.HOME_TABS_SCREEN_ROUTE);
  }
}
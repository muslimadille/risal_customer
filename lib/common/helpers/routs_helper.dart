import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/features/auth/view/chage_password_screen.dart';
import 'package:risal_customer/features/auth/view/confirm_email_screen.dart';
import 'package:risal_customer/features/auth/view/edite_password_screen.dart';
import 'package:risal_customer/features/auth/view/forget_password_screen.dart';
import 'package:risal_customer/features/auth/view/login_screen.dart';
import 'package:risal_customer/features/home_tabs_screen/view/home_tabs_screen.dart';
import 'package:risal_customer/features/more/view/screens/info_screen.dart';
import 'package:risal_customer/features/more/view/screens/profile_screen.dart';
import 'package:risal_customer/features/orders/view/screens/order_details_screen.dart';
import 'package:risal_customer/features/pos/view/screens/po_details_screen.dart';
import 'package:risal_customer/features/spalsh/view/splash_screen.dart';

import 'app_navigator.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  AppNavigator().routeSettings=routeSettings;
  switch (routeSettings.name) {
    case AppRoutes.SPLASH_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>   const SplashScreen());
    case AppRoutes.LOGIN_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>   const LoginScreen());

    case AppRoutes.CHANGE_PASSWORD_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>  const ChangePasswordScreen());

    case AppRoutes.FORGET_PASSWORD_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>  const ForgetPasswordScreen());

    case AppRoutes.CONFIRM_EMAIL_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>  const ConfirmEmailScreen());

    case AppRoutes.HOME_TABS_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>   HomeTabsScreen(selectedIndex:routeSettings.arguments as int?));

    case AppRoutes.POS_DETAILS_SCREEN_ROUT:
      return MaterialPageRoute(builder: (_) =>    PoDetailsScreen(poId:routeSettings.arguments as int));

    case AppRoutes.ORDER_DETAILS_SCREEN_ROUT:
      return MaterialPageRoute(builder: (_) =>   OrderDetailsScreen(orderId:routeSettings.arguments as int));

    case AppRoutes.PROFILE_SCREEN_ROUT:
      return MaterialPageRoute(builder: (_) =>   ProfileScreen());
    case AppRoutes.INFO_SCREEN_ROUT:
      return MaterialPageRoute(builder: (_) =>   InfoScreen(arg: routeSettings.arguments as InfoScreenArgument));
    case AppRoutes.EDITE_PASSWORD_SCREEN_ROUT:
      return MaterialPageRoute(builder: (_) =>   EditePasswordScreen());

    default:
      return MaterialPageRoute(builder: (_) =>   const LoginScreen());
  }
}
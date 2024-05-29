import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/features/auth/view/login_screen.dart';
import 'package:risal_customer/features/spalsh/view/splash_screen.dart';

import 'app_navigator.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  AppNavigator().routeSettings=routeSettings;
  switch (routeSettings.name) {
    case AppRoutes.SPLASH_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>   SplashScreen());
    case AppRoutes.LOGIN_SCREEN_ROUTE:
      return MaterialPageRoute(builder: (_) =>   LoginScreen());

    default:
      return MaterialPageRoute(builder: (_) =>   LoginScreen());
  }
}
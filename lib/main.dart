import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:risal_customer/applications/mainApplication.dart';
import 'package:risal_customer/common/helpers/device_info_details.dart';
import 'package:risal_customer/common/helpers/local_storage.dart';
import 'package:risal_customer/common/helpers/routs_helper.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/features/spalsh/view/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'common/helpers/app_localization.dart';
import 'common/helpers/app_navigator.dart';
import 'common/helpers/hive_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    DeviceInfoDetails().initPlatformState().then((value) async {
      await Future.wait(
          [
            LocalStorage().init(),
            DeviceInfoDetails().getDeviceInfoMap()
          ]
      );
    })
  ]);
  HiveHelper().initAdaptors();
  runApp(MultiProvider(
    providers: MainApplication.applicationList,
    child: const MyApp(),
  ));
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..boxShadow = [BoxShadow(color: Colors.transparent)]
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..progressColor = Colors.black
    ..dismissOnTap = false
    ..fontSize = 20;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppLocalization().onInit();
    localization.onTranslatedLanguage = (local) {
      setState(() {});
    };
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        //key:UniqueKey(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.BLUE_DARK),
          fontFamily: GoogleFonts.getFont('Cairo').fontFamily,),
        navigatorKey: AppNavigator().navigatorKey,
        onGenerateRoute: onGenerateRoute,
        supportedLocales: const [
          Locale("en"),
          Locale("ar"),
        ],
        localizationsDelegates: localization.localizationsDelegates,
        locale: AppLocalization.isArabic ?  Locale("ar") :  Locale("en"),
        builder: EasyLoading.init(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ), //set desired text scale factor here
              child: child??const SplashScreen(),
            );
          },
        ),
        home: const SplashScreen(),
      );
    });
  }
}


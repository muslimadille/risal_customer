import 'dart:ui';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:risal_customer/common/utils/app_data.dart';

import 'local_storage.dart';

final FlutterLocalization localization = FlutterLocalization.instance;
tr(String key){
  return AppLocalization.translate(key);
}
class AppLocalization{

  static AppLocalization? _instance;

  AppLocalization._internal();

  factory AppLocalization() {
    return _instance??=AppLocalization._internal();
  }

   onInit() async{
    await localization.init(
      mapLocales: [
        const MapLocale('en', AppLocalization.EN),
        const MapLocale('ar', AppLocalization.AR),
      ],
      initLanguageCode: 'en',
    );
    _initLocal();
  }

  static  String translate(String key){
    return (isArabic?AR[key]??key:EN[key]??key);
  }
  static changeLanguage(String localKey)async{
    LocalStorage().putInBox(key: AppData.LANG_STORAGE_KEY, value: localKey);
    AppData.CURRENT_LANG=localKey;
    String code=localization.currentLocale!.languageCode.toString();
     localization.translate(localKey);
  }
   _initLocal(){
    AppData.CURRENT_LANG=LocalStorage().getFromBox(key: AppData.LANG_STORAGE_KEY)??"en";
    String code=localization.currentLocale!.languageCode.toString();
    if(code=="ar"){
      localization.translate("en");
    }
    Future.delayed(Duration(milliseconds: 3)).then((value){
      localization.translate(AppData.CURRENT_LANG);
    });
  }

  static bool  get isArabic=>localization.currentLocale==const Locale("ar");

  // add your localization keys here
  static const Map<String, dynamic> EN = {
   "login_title":"Getting Started",
    "Email":"Email",
    "password":"Password",
    "password_hint":"*Please fill this field with the password which sent to your E-mail"

};
  static const Map<String, dynamic> AR = {
    "login_title":"تسجيل الدخول",
    "Email":"البريد  الإلكتروني",
    "password":"كلمة المرور",
    "password_hint":"*يرجى ملء هذا الحقل بكلمة المرور التي تم إرسالها إلى بريدك الإلكتروني"
  };
}

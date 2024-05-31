import 'dart:ui';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:risal_customer/common/utils/app_data.dart';

import 'local_storage.dart';

final FlutterLocalization localization = FlutterLocalization.instance;
tr(String key){
  return AppLocalization.translate(key);
}
get isArabic=>AppLocalization.isArabic;
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
  static changeLanguage()async{
    String code=localization.currentLocale!.languageCode.toString();
    AppData.CURRENT_LANG=code=="ar"?"en":"ar";
    LocalStorage().putInBox(key: AppData.LANG_STORAGE_KEY, value: AppData.CURRENT_LANG);
    localization.translate(AppData.CURRENT_LANG);
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
    "password_hint":"*Please fill this field with the password which sent to your E-mail",
    "login_change_language_title":"العربية",
    "terms_title_1":"By creating an account you agree to our",
    "terms_title_2":"Terms & Conditions",
    "change_password_title":"Change Password",
    "new_password":"New Password",
    "confirm_new_password":"Confirm new password",
    "login_btn_title":"Get start",
    "change_password_btn_title":"Set password",
    "forget_password_title":"Edit password"

};
  static const Map<String, dynamic> AR = {
    "login_title":"تسجيل الدخول",
    "Email":"البريد  الإلكتروني",
    "password":"كلمة المرور",
    "password_hint":"*يرجى ملء هذا الحقل بكلمة المرور التي تم إرسالها إلى بريدك الإلكتروني",
    "login_change_language_title":"English",
    "terms_title_1": "بإنشاء حساب، أنت توافق على",
    "terms_title_2": "الشروط والأحكام",
    "change_password_title":"تعديل كلمة المرور",
    "new_password":"كلمة المرور الجديدة",
    "confirm_new_password":"تأكيد كلمة المرور",
    "login_btn_title":"ابدأ",
    "change_password_btn_title":"تأكيد",
    "forget_password_title":"تعديل كلمة المرور"

  };
}

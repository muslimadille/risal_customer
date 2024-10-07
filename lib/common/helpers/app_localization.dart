import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:risal_customer/common/utils/app_data.dart';

import 'local_storage.dart';

final FlutterLocalization localization = FlutterLocalization.instance;
late final ValueNotifier<bool> languageNotifier;

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
     languageNotifier=ValueNotifier<bool>(isArabic);
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
    languageNotifier.value=isArabic;
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
    "forget_password_title":"Forget password",
    "confirm_email_title":"Confirm E-mail",
    "pos_tab":"POs",
    "orders_tab":"Orders",
    "more_tab":"More",
    "pos_screen_title":"Purchase Orders",
    "pos_num":"PO number: ",
    "active":"Active",
    "pending":"Pending",
    "closed":"Closed",

    "delivered":"Delivered",
    "Total":"Total: ",
    "SAR":"SAR",
    "down_payment":"Down Payment: ",
    "search":"Search",
    "clear_filter_bt_title":"Clear Filter ",
    "filter":"Filter",
    "STATUS":"Status",
    "DONE":"Done",
    "select_satus":"Select status",
    "change_lang":"Change language",
    "orders_screen_title":"Orders",
    "help_center_btn_title":"Help Center",
    "terms_btn_title":"Terms & Conditions",
    "privacy_btn_title":"Privacy Policy",
    "log_out":"Logout",
    "No_delevery_address":"There is no delivery address",
    "quantity":"Qty: ",
    "duration":"Duration: ",
    "chek_our":"Check our",
    "profile":"Profile",
    "profile_name":"Name",
    "profile_phone":"Phone number",
    "profile_cr":"CR",
    "profile_address":"Address",
    "profile_contact_person":"Contact person",
    "edite_password":"Edite password",
    "edite_password_title":"Edite password",
    "old_password_title":"Old password",
    "forget_password_text":"Forget password?",
    "receive_service_btn":"Receive the service",
    "report_issue_btn":"Report an issue",
    "confirm":"Confirm",
    "confirm_title":"Confirm your delivery note",
    "confirm_subtitle":"Please confirm that you received the order",
    "Hours":" Hours",
    "Delivery Details":"Delivery Details",
    "Delivery Service Details":"Service Details",
    "Payment Details":"Payment Details",
    "order_num":"Order_Num: ",
    "report_issue_title":"Report your issue",
    "report_issue_subtitle":"Write your reason",
    "requests_tab":"Requests",
    "add_order_request":"Add order request"

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
    "forget_password_title":"نسيت كلمة المرور",
    "confirm_email_title":"تأكيد البريد الإلكترروني",
    "pos_tab":"POs",
    "orders_tab":"الطلبات",
    "more_tab":"المزيد",
    "pos_screen_title":"طلبات الشراء",
    "pos_num":"رقم الطلب: ",
    "active":"نشط",
    "delivered":"تم التوصيل",
    "Total":"إجمالي: ",
    "SAR":"ر.س",
    "down_payment":"دفعة مبدئية: ",
    "search":"بحث",
    "clear_filter_bt_title":"مسح الفلتر",
    "filter":"فلتر",
    "STATUS":"الحالة",
    "DONE":"تم",
    "select_satus":"قم باختيار الحالة",
    "change_lang":"تغيير اللغة",
    "orders_screen_title":"الطلبات",
    "help_center_btn_title":"مركز المساعدة",
    "terms_btn_title":"الشروط والأحكام",
    "privacy_btn_title":"سياسة الخصوصية",
    "log_out":"تسجيل الخروج",
    "No_delevery_address":"لا يوجد  عنوان توصيل",
    "quantity":"الكمية: ",
    "duration":"المدة: ",
    "chek_our":"تعرف علي",
    "profile":"الملف  الشخصي",
    "profile_name":"الاسم",
    "profile_phone":"رقم الجوال",
    "profile_cr":"CR",
    "profile_address":"العنوان",
    "profile_contact_person":"صاحب رقم التواصل",
    "edite_password":"تعديل كلمة المرور",
    "edite_password_title":"تعديل كلمة المرور",
    "old_password_title":"كلمة المرور القديمة",
    "forget_password_text":"نسيت كلمة المرور؟",
    "receive_service_btn":"استقبال الخدمة",
    "report_issue_btn":"الابلاغ عن مشكلة",
    "confirm":"تأكيد",
    "confirm_title":"تأكيد التوصيل",
    "confirm_subtitle":"الرجاء تأكيد استلام الطلب",
    "Hours":" ساعة",
  "Delivery Details": "تفاصيل التسليم",
  "Delivery Service Details": "تفاصيل الخدمة",
  "Payment Details": "تفاصيل الدفع",
    "no_pos_found":"لا يوجد لديك طلبات شراء",
    "pending":"معلق",
    "closed":"مغلق",
    "order_num":"رقم الطلب: ",
    "report_issue_title":"أبلغ عن مشكلتك",
    "report_issue_subtitle":"اكتب سببك",
    "requests_tab":"الطلبات",
    "add_order_request":"إضافة طلب"

  };
}

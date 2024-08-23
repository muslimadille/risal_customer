import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:sizer/sizer.dart';

class LoginChangeLanguageBtn extends StatelessWidget {
  const LoginChangeLanguageBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        await AppLocalization.changeLanguage();
        AppNavigator().pushReplacement(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:4.w),
        child: Row(children: [
          SvgPicture.asset(AppImages.LOGIN_CHANGE_LANGUAGE_IC),
          SizedBox(width: 1.w,),
          Text("login_change_language_title".translate)
        ],),
      ),
    );
  }
}

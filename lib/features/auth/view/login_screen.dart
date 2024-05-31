import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:risal_customer/features/auth/viewModel/login_helper.dart';
import 'package:sizer/sizer.dart';
import 'items/login_change_language_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG_COLOR,
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
              height: 10.h,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    "login_title".translate,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
                  ),
                  Positioned(left: isArabic ? 0 : null, right: isArabic ? null : 0, child: LoginChangeLanguageBtn())
                ],
              )),
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
            title: "Email",
            inputType: TextInputType.emailAddress,
            controller: TextEditingController(),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            isPassword: true,
            title: "password",
            inputType: TextInputType.visiblePassword,
            controller: TextEditingController(),
          ),
          SizedBox(
            height: 0.3.h,
          ),
          Text(
            "password_hint".translate,
            style: TextStyle(fontSize: 9.5.sp, fontWeight: FontWeight.w500, color: AppColors.BLUE_DARK),
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomBtn(
            title: 'login_btn_title'.translate,
            onClick: (){},
            ),
          const Expanded(child: SizedBox()),
          Text(
            "terms_title_1".translate,
            style: TextStyle(color: AppColors.GREY, fontWeight: FontWeight.w500, fontSize: 10.sp),
          ),
          InkWell(
              onTap: onTermsClick,
              child: Text(
                "terms_title_2".translate,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.BLACK, fontWeight: FontWeight.w500, fontSize: 10.sp,),
              )),
          SizedBox(
            height: 3.h,
          )
        ],
      ),
    );
  }
}

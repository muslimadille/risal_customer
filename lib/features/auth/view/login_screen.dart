import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/utils/app_style.dart';
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
  void initState() {
    onInit();
    super.initState();
  }
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: AppColors.BG_COLOR,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              controller: emailController,
              onChange: (value){
                checkLoginButtonState();
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              isPassword: true,
              title: "password",
              inputType: TextInputType.visiblePassword,
              controller: passwordController,
              onChange:(value){
                checkLoginButtonState();
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(height: 1.h,),
            InkWell(
              onTap: (){
                AppNavigator().push(routeName: AppRoutes.FORGET_PASSWORD_SCREEN_ROUTE);
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:4.w),
                child: Text("forget_password_text".translate,style: TextStyle(fontSize: 12.sp,color:AppColors.GREY_DARK ),),
              ),),
            SizedBox(
              height: 8.h,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: loginButtonState,
              builder: (context,status,_) {
                return CustomBtn(
                  title: 'login_btn_title'.translate,
                  style: status?AppStyle.BTN_STYLE:AppStyle.BTN_STYLE_IACTIVE,
                  onClick: (){
                    if(status){onLoginClick();}
                  },
                  );
              }
            ),
            Expanded(child: SizedBox()),
            Center(
              child: Text(
                "terms_title_1".translate,
                style: TextStyle(color: AppColors.GREY, fontWeight: FontWeight.w500, fontSize: 10.sp),
              ),
            ),
            Center(
              child: InkWell(
                  onTap: onTermsClick,
                  child: Text(
                    "terms_title_2".translate,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.BLACK, fontWeight: FontWeight.w500, fontSize: 10.sp,),
                  )),
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    );
  }
}

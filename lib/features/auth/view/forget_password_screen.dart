import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import '../../../common/helpers/app_localization.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      SizedBox(height: 5.h,),
      SizedBox(
          height:8.h,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                "forget_password_title".translate,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
               Positioned(left: isArabic ? 4.w : null, right: isArabic ? null : 4.w,
                    child:GestureDetector(
                        onTap: (){
                          AppNavigator().goBack();
                        },
                        child: SvgPicture.asset(AppImages.CLOSE_IC)),
              )
            ],
          )),
      SizedBox(height: 5.h,),
      CustomTextField(
        isPassword: true,
        title: "new_password",
        inputType:TextInputType.visiblePassword ,
        controller: TextEditingController(),
      ),
      SizedBox(height: 2.h,),
      CustomTextField(
        isPassword: true,
        title: "confirm_new_password",
        inputType:TextInputType.visiblePassword ,
        controller: TextEditingController(),
      ),
      SizedBox(
        height: 4.h,
      ),
      CustomBtn(
        title: 'change_password_btn_title'.translate,
        onClick: (){},
      ),

    ],),);
  }
}

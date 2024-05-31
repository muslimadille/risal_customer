import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import '../../../common/helpers/app_localization.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG_COLOR,
      body: Column(children: [
      SizedBox(height: 8.h,),
      Text(tr("change_password_title"),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w800),),
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

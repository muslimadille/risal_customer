import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../common/helpers/app_localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      SizedBox(height: 10.h,),
       Text(tr("login_title"),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w800),),
      SizedBox(height: 5.h,),
      CustomTextField(
         title: "Email",
         inputType:TextInputType.emailAddress,
         controller: TextEditingController(),
       ),
      SizedBox(height: 2.h,),
      CustomTextField(
        isPassword: true,
        title: "password",
        inputType:TextInputType.visiblePassword ,
        controller: TextEditingController(),
      ),
      SizedBox(height: 0.3.h,),
      Text(tr("password_hint"),style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.BLUE_DARK),),

    ],),);
  }
}

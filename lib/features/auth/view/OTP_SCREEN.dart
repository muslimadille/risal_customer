import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';

import '../../../common/helpers/app_localization.dart';
import '../../../common/helpers/app_navigator.dart';
import '../../../common/widgets/custom_btn.dart';
import '../../../common/widgets/custom_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                "confirm_email_title".translate,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
              ),
              Positioned(left: isArabic ? null:4.w, right: isArabic ?4.w: null,
                child:GestureDetector(
                    onTap: (){
                      AppNavigator().goBack();
                    },
                    child: SvgPicture.asset(AppImages.BACK_BTN_IC,matchTextDirection: true,)),
              )
            ],
          )),
      SizedBox(height: 5.h,),
      CustomTextField(
        title: "Email",
        inputType: TextInputType.emailAddress,
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

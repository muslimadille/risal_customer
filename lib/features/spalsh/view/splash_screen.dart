import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/features/spalsh/view_model/splash_helper.dart';
import 'package:sizer/sizer.dart';


class SplashScreen extends StatelessWidget with SplashHelper  {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      backgroundColor: AppColors.RED,
      body: Center(
      child: Image.asset(AppImages.LOGO_IMG,width: 60.w,),
    ),);
  }
}

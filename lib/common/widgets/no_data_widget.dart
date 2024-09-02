import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class NoDataWidget extends StatelessWidget {
  final String title,icon;
  const NoDataWidget({required this.title,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon,height: 20.h,color: AppColors.GREY,),
        SizedBox(height: 2.w,),
        Text(title.translate,style: TextStyle(fontSize: 12.sp,color: AppColors.GREY),)
      ],);
  }
}

import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class MoreWhiteContainer extends StatelessWidget {
  final Widget body;
  const MoreWhiteContainer({super.key,required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
      margin:EdgeInsets.symmetric(horizontal: 6.w) ,
      decoration:const BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow:[
            BoxShadow(
                color:AppColors.GREY,
                blurRadius: 10,
                spreadRadius: 0
            )
          ]
      ),
      child: body,
    );
  }
}

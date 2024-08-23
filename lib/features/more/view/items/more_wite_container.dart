import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class MoreWhiteContainer extends StatelessWidget {
  final Widget body;
  final EdgeInsets? margin;
  const MoreWhiteContainer({super.key, required this.body,this.margin});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
      margin:margin??EdgeInsets.symmetric(horizontal: 6.w) ,
      decoration: BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow:[
            BoxShadow(
                color:AppColors.GREY.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 0
            )
          ]
      ),
      child: body,
    );
  }
}

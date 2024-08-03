import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
      margin:EdgeInsets.symmetric(horizontal: 6.w) ,
      decoration:const BoxDecoration(
          color: AppColors.BLUE_DARK,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow:[
            BoxShadow(
                color:AppColors.GREY,
                blurRadius: 10,
                spreadRadius: 0
            )
          ]
      ),
      child:Row(children: [
        Container(
          padding: EdgeInsets.all(4.w),
          decoration:const BoxDecoration(
              color: AppColors.WHITE,
              borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: SvgPicture.asset(AppImages.AVATAR_IC),),
        SizedBox(width:4.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Aya Magdy Ibrahim",style: TextStyle(color: AppColors.WHITE,fontSize: 11.sp,fontWeight: FontWeight.w700),),
          Text("+966 557687987",style: TextStyle(color: AppColors.GREEN_LGIHT,fontSize: 9.sp,fontWeight: FontWeight.w400),)
        ],)
      ],)
    );
  }
}

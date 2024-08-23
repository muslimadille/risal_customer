import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class FiltterBtnWidget extends StatelessWidget {
  final Function onClick;

  const FiltterBtnWidget({required this.onClick,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
        decoration:const BoxDecoration(
            color: AppColors.WHITE,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow:[
              BoxShadow(
                  color:AppColors.GREY,
                  blurRadius: 10,
                  spreadRadius: 0
              )
            ]
        ),
        child:SvgPicture.asset(AppImages.FILTTER_IC),
      ),
    );
  }
}

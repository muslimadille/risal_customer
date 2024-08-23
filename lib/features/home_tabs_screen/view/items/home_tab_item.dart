import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class HomeTabItem extends StatelessWidget {
  final String icon,title;
  final bool isSelected;
  final Function onClick;

   HomeTabItem({required  this.onClick,required this.isSelected,required this.title,required  this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Column(children: [
        SvgPicture.asset(icon,color: isSelected?AppColors.RED:AppColors.GREY_DARK,),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: isSelected?AppColors.RED:AppColors.GREY_DARK,fontSize:9.sp,fontWeight: FontWeight.w400 ),)
      ],),
    );
  }
}

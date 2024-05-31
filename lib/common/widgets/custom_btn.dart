import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_style.dart';
import 'package:sizer/sizer.dart';

class CustomBtn extends StatelessWidget {
  final Function onClick;
  final String title;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  const CustomBtn({super.key, required this.onClick, required this.title, this.style, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:4.w),
      child: ElevatedButton(
        style: style??AppStyle.BTN_STYLE,
        onPressed: (){
          onClick();
        },
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(minWidth: 45.w),
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
           title,
            textAlign: TextAlign.center,
            style: textStyle??TextStyle(
                color: AppColors.WHITE,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          ),
        ),
      ),);
  }
}

import 'package:flutter/material.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppStyle{
  static ButtonStyle BTN_STYLE =ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor:AppColors.BLUE_DARK,
    padding:  EdgeInsets.symmetric(vertical:1.h),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side:  const BorderSide(
          width: 1.0,
          color: AppColors.BLUE_DARK,
        )
    ),
  );
  static ButtonStyle BTN_STYLE_IACTIVE =ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor:AppColors.GREY,
    padding:  EdgeInsets.symmetric(vertical:1.h),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side:  const BorderSide(
          width: 1.0,
          color: AppColors.GREY,
        )
    ),
  );
}
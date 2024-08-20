import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/top_snackbar_custom/top_snack_bar.dart';
import 'package:sizer/sizer.dart';

import '../helpers/app_localization.dart';

class CustomSnakbar {
  static CustomSnakbar? _singleton;

  factory CustomSnakbar() {
    _singleton = _singleton ?? CustomSnakbar._internal();
    return _singleton!;
  }

  CustomSnakbar._internal();

  late AnimationController _localAnimationController;

  appSnackBar({
    required String text,
    bool? isFaild,
    String? textBtn,
    void Function()? onClick
  }) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: 6.h, right: 5.w, left: 5.w),
      duration: const Duration(seconds: 4),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline_sharp,
            color: (isFaild??false)
                ?AppColors.WHITE
                : AppColors.WHITE,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text.translate,
              style: TextStyle(
                  fontSize:14.sp,
                  color: isFaild??false
                      ? AppColors.WHITE
                      : AppColors.WHITE,
                  fontWeight: FontWeight.w500),
              textAlign: AppLocalization.isArabic?TextAlign.right:TextAlign.left,
              textDirection: TextDirection.ltr,
            ),
          ),
          Visibility(
            visible: (textBtn??"").isNotEmpty,
            child: TextButton(
                onPressed: (){
                  if(onClick!=null){
                    onClick();
                  }
                },
                child: Text(
                  AppLocalization
                      .translate(textBtn??""),
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
            ),
          )
        ],
      ),
      backgroundColor: (isFaild??false)
          ? AppColors.RED
          : AppColors.GREEN,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      padding: EdgeInsets.all(10),
      dismissDirection: DismissDirection.none,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(AppNavigator().currentContext())
          .showSnackBar(snackBar);
    });
  }

  showAppTopSnackBar(
      {required String title,
      required String body,
      required void Function() onClick}) {
    showTopSnackBar(
        Overlay.of(AppNavigator().currentContext()),
        dismissType: DismissType.onTap,
        onAnimationControllerInit: (controller) =>
            _localAnimationController = controller,
        onTap: onClick,
        curve: Curves.elasticOut,
        Container(
            decoration: BoxDecoration(
              color: AppColors.GREY,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(1.5.h),
              leading: Icon(Icons.notifications_active,color: AppColors.GREEN,size: 5.w,),
              dense: true,
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              subtitle: Text(
                body,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )));
  }

  hideTopSnackbar() {
    _localAnimationController.reverse();
  }

  hideSnackbar() {
    ScaffoldMessenger.of(AppNavigator().currentContext()).hideCurrentSnackBar();
  }
}

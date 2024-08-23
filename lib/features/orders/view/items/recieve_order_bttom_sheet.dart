import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_dropdown_widget.dart';
import 'package:sizer/sizer.dart';

class RecieveOrderBottomSheet extends StatefulWidget {
  final Function() onDone;


  RecieveOrderBottomSheet({
    required this.onDone,
    super.key});

  @override
  State<RecieveOrderBottomSheet> createState() => _RecieveOrderBottomSheetState();
}

class _RecieveOrderBottomSheetState extends State<RecieveOrderBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30.h,
      decoration:const BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 2.h,),
          SizedBox(height: 1.5.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.w),
            child: Text("confirm_title".translate,style:TextStyle(fontSize:14.sp,fontWeight: FontWeight.w700) ,),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.w),
            child: Text("confirm_subtitle".translate,style:TextStyle(fontSize:12.5.sp) ,),
          ),
          SizedBox(height: 5.h,),
          CustomBtn(onClick: (){
            AppNavigator().goBack();
            widget.onDone();
          }, title: "confirm".translate)
        ],),
    );
  }
}

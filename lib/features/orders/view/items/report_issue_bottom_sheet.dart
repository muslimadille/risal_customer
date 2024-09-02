import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_style.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class ReportIssueBottomSheet extends StatefulWidget {
  final void Function(String title, String message) onDone;


  ReportIssueBottomSheet({
    required this.onDone,
    super.key});

  @override
  State<ReportIssueBottomSheet> createState() => _ReportIssueBottomSheetState();
}

class _ReportIssueBottomSheetState extends State<ReportIssueBottomSheet> {
  final TextEditingController controller=TextEditingController();
  bool isButtonActive=false;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.w),
            child: Text("report_issue_title".translate,style:TextStyle(fontSize:14.sp,fontWeight: FontWeight.w700) ,),
          ),
          SizedBox(height: 1.h,),
          CustomTextField(
            title: "report_issue_subtitle",
            inputType: TextInputType.text,
            controller: controller,
            onChange: (value){
              setState(() {
                isButtonActive=value.isNotEmpty;
              });
            },
          ),
          SizedBox(height: 5.h,),
          CustomBtn(
            style: isButtonActive?null:AppStyle.BTN_STYLE_IACTIVE,
              onClick:isButtonActive? (){
            AppNavigator().goBack();
            widget.onDone("ordr issue",controller.text );
          }:(){}, title: "confirm".translate)
        ],),
    );
  }
}

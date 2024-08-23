import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/helpers/app_localization.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  State<ChangeLanguageBottomSheet> createState() => _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft:Radius.circular(5)),
        border: Border.fromBorderSide(
            BorderSide(
              width:1,
              color:AppLocalization.isArabic?Colors.black:Colors.grey,
            )
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            SizedBox(width: 5.w,),
            Expanded(child: Text("Change Language",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),textAlign: TextAlign.center,)),
            IconButton(onPressed: (){AppNavigator().goBack();}, icon: Icon(Icons.close)),
          ],
        ),
        Container(width: double.infinity,height: 1,color: Colors.grey[200],),
        SizedBox(height: 3.h,),
        GestureDetector(
          onTap: (){
            AppLocalization.changeLanguage();
            AppNavigator().goBack();
          },
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical:2.h,horizontal: 10.w),
            decoration: BoxDecoration(
              color:AppLocalization.isArabic?Colors.black:Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.fromBorderSide(
                  BorderSide(
                    width:1,
                    color:AppLocalization.isArabic?Colors.black:Colors.grey,
                  )
              ),
            ),
            child: Text("العربية",style:TextStyle(
                color: AppLocalization.isArabic?Colors.white:Colors.black,
                fontSize: 12.sp,fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 2.h,),

        GestureDetector(
          onTap: (){
            AppLocalization.changeLanguage();
            AppNavigator().goBack();
          },
          child: Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical:2.h,horizontal: 10.w),
            decoration: BoxDecoration(
              color:!AppLocalization.isArabic?Colors.black:Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.fromBorderSide(
                  BorderSide(
                    width:1,
                    color:!AppLocalization.isArabic?Colors.black:Colors.grey,
                  )
              ),
            ),
            child: Text("English",style:TextStyle(
                color: !AppLocalization.isArabic?Colors.white:Colors.black,
                fontSize: 12.sp,fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 8.h,),

      ],),);
  }
}

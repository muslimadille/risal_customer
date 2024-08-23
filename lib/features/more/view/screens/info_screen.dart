import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class InfoScreen extends StatelessWidget {
  final InfoScreenArgument arg;
  const InfoScreen({required this.arg,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG_COLOR,
      body: Padding(
        padding:  EdgeInsets.only(top:7.h,bottom: 5.h,left:
        2.w,right: 2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: (){
                              AppNavigator().goBack();
                            },
                            child: SvgPicture.asset(AppImages.BACK_BTN_IC,matchTextDirection: true,)),
                      ],
                    )),
                Expanded(flex: 2,child: Center(child: Text(arg.title.translate
                  ,style: TextStyle(fontSize: 16.sp,),))),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                    ],
                  ),
                )

              ],),
            ),
            SizedBox(height: 2.h,),
            Expanded(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:5.w),
              child: Text(arg.content,style:TextStyle(fontSize: 10.sp),),
            )),

          ],),
      ),
    );
  }

}
class InfoScreenArgument{
  String title,content;
  InfoScreenArgument({required this.title,required this.content});
}

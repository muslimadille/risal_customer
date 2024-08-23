import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/features/more/model/profile_model.dart';
import 'package:risal_customer/features/more/view_model/more_screen_helper.dart';
import 'package:sizer/sizer.dart';

class UserCardWidget extends StatelessWidget with MoreScreenHelper{
   UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    onInit();
    return InkWell(
      onTap: (){
        AppNavigator().push(routeName: AppRoutes.PROFILE_SCREEN_ROUT);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
        margin:EdgeInsets.symmetric(horizontal: 6.w) ,
        decoration:const BoxDecoration(
            color: AppColors.BLUE_DARK,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow:[
              BoxShadow(
                  color:AppColors.GREY,
                  blurRadius: 10,
                  spreadRadius: 0
              )
            ]
        ),
        child:StreamBuilder<ProfileData>(
          stream: profileController.stream,
          builder: (context, snapshot) {
            return Row(children: [
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
                Text(snapshot.hasData?snapshot.data!.name:"***********",style: TextStyle(color: AppColors.WHITE,fontSize: 11.sp,fontWeight: FontWeight.w700),),
                Text(snapshot.hasData?snapshot.data!.phone:"***********",style: TextStyle(color: AppColors.GREEN_LGIHT,fontSize: 9.sp,fontWeight: FontWeight.w400),)
              ],)
            ],);
          }
        )
      ),
    );
  }
}

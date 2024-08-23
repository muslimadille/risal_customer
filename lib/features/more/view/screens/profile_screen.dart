import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/utils/app_style.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:risal_customer/features/more/model/profile_model.dart';
import 'package:risal_customer/features/more/view_model/more_screen_helper.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>with MoreScreenHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG_COLOR,
      body: Padding(
        padding:  EdgeInsets.only(top:7.h,bottom: 5.h,left:
        2.w,right: 2.w),
        child: StreamBuilder<ProfileData>(
            stream:profileController.stream,
            builder: (context,snapshot) {
              return snapshot.hasData?Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      Expanded(flex: 2,child: Center(child: Text("profile".translate
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
                  Expanded(child: ListView(children: [
                    CustomTextField(
                      enabled: false,
                      color: AppColors.WHITE,
                      title: "profile_name",
                      inputType: TextInputType.emailAddress,
                      controller: TextEditingController()..text=snapshot.data!.name,
                      onChange: (value){
                      },
                    ),
                    SizedBox(height: 1.h,),
                    CustomTextField(
                      enabled: false,
                      color: AppColors.WHITE,
                      title: "profile_phone",
                      inputType: TextInputType.emailAddress,
                      controller: TextEditingController()..text=snapshot.data!.phone,
                      onChange: (value){
                      },
                    ),
                    SizedBox(height: 1.h,),
                    CustomTextField(
                      enabled: false,
                      color: AppColors.WHITE,
                      title: "profile_cr",
                      inputType: TextInputType.emailAddress,
                      controller: TextEditingController()..text=snapshot.data!.cr,
                      onChange: (value){
                      },
                    ),
                    SizedBox(height: 1.h,),
                    CustomTextField(
                      enabled: false,
                      color: AppColors.WHITE,
                      title: "profile_address",
                      inputType: TextInputType.emailAddress,
                      controller: TextEditingController()..text=snapshot.data!.address??"",
                      onChange: (value){
                      },
                    ),
                    SizedBox(height: 1.h,),
                    CustomTextField(
                      enabled: false,
                      color: AppColors.WHITE,
                      title: "profile_contact_person",
                      inputType: TextInputType.emailAddress,
                      controller: TextEditingController()..text=snapshot.data!.contactPersonName,
                      onChange: (value){
                      },
                    ),
                  ],)),
                  CustomBtn(style: AppStyle.BORDER_BTN_STYLE,
                      textStyle:TextStyle(
                          color: AppColors.BLUE_DARK,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp) ,
                      onClick: (){
                    AppNavigator().push(routeName: AppRoutes.EDITE_PASSWORD_SCREEN_ROUT);
                      }, title: "edite_password".translate),
                  SizedBox(height: 2.h,),
                  InkWell(
                    onTap: (){
                      logout();
                    },
                    child: Center(child:
                    Text("log_out".translate,style: TextStyle(
                        color: AppColors.BLUE_DARK,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),),),)
                ],)
                  :SizedBox();
            }
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/utils/app_style.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:risal_customer/features/auth/viewModel/edite_password_helper.dart';
import 'package:sizer/sizer.dart';

class EditePasswordScreen extends StatefulWidget {
  const EditePasswordScreen({super.key});

  @override
  State<EditePasswordScreen> createState() => _EditePasswordScreenState();
}

class _EditePasswordScreenState extends State<EditePasswordScreen> with EditePasswordHelper{
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
      resizeToAvoidBottomInset: false,
      body: Form(
        key:formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 8.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                ],
              ),
            ),
            Expanded(flex: 2,child: Center(child: Text("edite_password_title".translate
              ,style: TextStyle(fontSize: 16.sp,),))),
            Expanded(
                flex: 1,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: (){
                          AppNavigator().goBack();
                        },
                        child: SvgPicture.asset(AppImages.CLOSE_PAGE_IC,matchTextDirection: true,)),
                  ],
                ))
          ],),
        ),
        SizedBox(height: 8.h,),
        CustomTextField(
          isPassword: true,
          title: "old_password_title",
          inputType:TextInputType.visiblePassword ,
          controller: oldPasswordController,
          onChange: (value){
            updateButtonState();
          },
        ),
          SizedBox(height: 1.h,),
          InkWell(
            onTap: (){
              AppNavigator().push(routeName: AppRoutes.FORGET_PASSWORD_SCREEN_ROUTE);
            },
            child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.w),
            child: Text("forget_password_text".translate,style: TextStyle(fontSize: 12.sp,color:AppColors.GREY_DARK ),),
          ),),
        SizedBox(height: 4.h,),
        CustomTextField(
          isPassword: true,
          title: "new_password",
          inputType:TextInputType.visiblePassword ,
          controller: newPasswordController,
          onChange: (value){
            updateButtonState();
          },
        ),
        SizedBox(height: 2.h,),
        CustomTextField(
          isPassword: true,
          title: "confirm_new_password",
          inputType:TextInputType.visiblePassword ,
          controller: confirmPasswordController,
          onChange: (value){
            updateButtonState();
          },
        ),
        SizedBox(
          height: 4.h,
        ),
        StreamBuilder<bool>(
          stream: buttonController.stream,
          builder: (context, snapshot) {
            return CustomBtn(
              title: 'change_password_btn_title'.translate,
              onClick:(){
                if((snapshot.data??false)){
                  editePassword();
                }
              },
              style: (snapshot.data??false)?AppStyle.BTN_STYLE:AppStyle.BTN_STYLE_IACTIVE,
            );
          }
        ),

            ],),
      ),);
  }
}

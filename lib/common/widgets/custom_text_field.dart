import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? title;
  final TextInputType? inputType;
  final Function(String)? onChange;
  final bool?isPassword;
  const CustomTextField({
    this.isPassword,
    required this.controller,
    this.validator,
    this.title,
    this.inputType,
    this.onChange,
    super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:3.w),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: (widget.title??"").isNotEmpty,
              child: Text(tr(widget.title??""),style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w500,color: Colors.black),)),
          SizedBox(height:0.6.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: const Border.fromBorderSide(
                    BorderSide(
                        width:1,
                        color:AppColors.GREY
                    )
                )
            ),
            padding: EdgeInsets.symmetric(horizontal:3.w,vertical:1.5.h),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller:widget.controller ,
                    style: TextStyle(
                      decorationThickness:0,
                      color: Colors.black,
                      fontSize:12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    onTapOutside: (value){
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder:InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense:true,
                    ),
                    keyboardType: widget.inputType ,
                    cursorColor: AppColors.GREY,
                    onChanged:widget.onChange,
                    validator:widget.validator,
                    obscureText: (widget.isPassword??false)&&(!showPassword),
                  ),
                ),
                Visibility(
                  visible:widget.isPassword??false,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: InkWell(onTap: (){
                      setState(() {
                        showPassword=!showPassword;
                      });
                    }, child: SvgPicture.asset(AppImages.SHOW_PASSWORD_IC,color:showPassword?AppColors.BLUE_DARK:null ,),),
                  ),
                )
              ],
            ),
          ),
        ],),);
  }
}

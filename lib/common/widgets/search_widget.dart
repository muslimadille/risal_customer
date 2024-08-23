import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_localization.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class SearchWidget extends StatelessWidget {
  final Function(String value) onClick;
  const SearchWidget({required this.onClick,super.key});

  @override
  Widget build(BuildContext context) {
     final TextEditingController controller=TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 5.w),
      decoration:const BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow:[
            BoxShadow(
                color:AppColors.GREY,
                blurRadius: 10,
                spreadRadius: 0
            )
          ]
      ),
      child: Row(children: [
        InkWell(
          onTap: (){
            onClick(controller.text);
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.w),
            child: Icon(Icons.search,color: AppColors.BLACK,textDirection: AppLocalization.isArabic?TextDirection.rtl:TextDirection.ltr,),
          ),
        ),
        SizedBox(width:4.w,),
        Expanded(
          child: TextFormField(
            controller: controller,
          
            style: TextStyle(
              decorationThickness:0,
              color: Colors.black,
              fontSize:12.sp,
              fontWeight: FontWeight.w500,
            ),
            onTapOutside: (value){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration:  InputDecoration(
              hintText:"search".translate,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder:InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense:true,
            ),
            cursorColor: AppColors.GREY,
            onChanged:(value){},
          ),
        )
      ],),
    );
  }
}

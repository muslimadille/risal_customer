import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/widgets/status_badge_widget.dart';


class PosListItem extends StatelessWidget {
  final PoModel poModel;
  const PosListItem({required this.poModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
      margin:EdgeInsets.symmetric(horizontal: 6.w) ,
      decoration:const BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow:[
            BoxShadow(
                color:AppColors.GREY,
                blurRadius: 10,
                spreadRadius: 0
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SvgPicture.asset(AppImages.POS_TERM_IC,width:10.w,),
              SizedBox(width: 2.w,),
              Expanded(child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("pos_num".translate,style: TextStyle(fontSize:10.5.sp),),
                  Expanded(child: Text(poModel.poNumber,maxLines: 1,style: TextStyle(fontSize:10.5.sp,fontWeight: FontWeight.w500,height: 1.5),)),
                ],
              ),),
              SizedBox(width: 2.w,),
              StatusBadgeWidget(status:poModel.status)
          ],),
          SizedBox(height: 1.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 12.w,),

              SvgPicture.asset(AppImages.POS_ITEM_TOTAL_IC,width:5.w,),
              SizedBox(width: 2.w,),
              Expanded(child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Total".translate+"",style: TextStyle(fontSize:10.5.sp),),
                  Text(poModel.poValue.toString()+"",style: TextStyle(fontSize:10.5.sp,fontWeight:FontWeight.w600),),
                  SizedBox(width:1.w,),
                  Text("SAR".translate,style: TextStyle(fontSize:10.5.sp,fontWeight: FontWeight.w500,),),
                ],
              ),),
            ],),
          Visibility(
            visible:poModel.downPaymentValue>0 ,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 12.w,),

                SvgPicture.asset(AppImages.POS_ITEM_DOWN_PAYMENT_IC,width:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("down_payment".translate+"",style: TextStyle(fontSize:10.5.sp),),
                    Text(poModel.downPaymentValue.toString()+"",style: TextStyle(fontSize:10.5.sp,fontWeight:FontWeight.w600),),
                    SizedBox(width:1.w,),
                    Text("SAR".translate,style: TextStyle(fontSize:10.5.sp,fontWeight: FontWeight.w500,),),
                  ],
                ),),
              ],),
          ),


        ],
      ),
    );
  }

}

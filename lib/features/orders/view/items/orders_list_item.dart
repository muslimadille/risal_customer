import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/widgets/status_badge_widget.dart';
import 'package:risal_customer/features/orders/model/orders_list_model.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:sizer/sizer.dart';


class OrderListItem extends StatelessWidget {
  final OrderModel orderModel;
  final Function onClick;
  const OrderListItem({required this.onClick,required this.orderModel,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onClick();
      },
      child: Container(
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
              SvgPicture.asset(AppImages.ORDERS_LIST_ITEM_IC,width:10.w,),
                SizedBox(width: 2.w,),
                Expanded(child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("order_num".translate,style: TextStyle(fontSize:10.5.sp),),
                    Expanded(child: Text(orderModel.id
                        .toString(),maxLines: 1,style: TextStyle(fontSize:12.5.sp,fontWeight: FontWeight.w500,height: 1.5),)),
                  ],
                ),),
                StatusBadgeWidget(status:orderModel.generalStatus??"")
            ],),
            SizedBox(height: 1.h,),
            (orderModel.pOService!=null)?Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 12.w,),

                SvgPicture.asset(AppImages.ORDERS_LIST_ITEM_NAME_IC,width:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child:
                Text(orderModel.service==null?"":orderModel.pOService!.title??"",style: TextStyle(fontSize:11.sp,fontWeight:FontWeight.w500,height: 1),),),
              ],):SizedBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 12.w,),
                SvgPicture.asset(AppImages.ORDERS_LIST_ITEM_DATE_IC,width:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child:
                Text(orderModel.date??"",style: TextStyle(fontSize:11.sp,fontWeight:FontWeight.w500),),),
              ],),


          ],
        ),
      ),
    );
  }
}

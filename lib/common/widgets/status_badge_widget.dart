import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class StatusBadgeWidget extends StatelessWidget {
  final String status;
  const StatusBadgeWidget({required this.status,super.key});

  @override
  Widget build(BuildContext context) {
    switch(status){
      case "active":return _item(title:"active",color: AppColors.BLUE_LGIHT,textColor: AppColors.BLUE );
      case "pending":return _item(title:"pending",color: AppColors.ORANG_LGIHT,textColor: AppColors.ORANG );
      case "closed":return _item(title:"closed",color: AppColors.GREY.withOpacity(0.3),textColor: AppColors.GREY_DARK );
      default: return SizedBox();
    }
  }
  Widget _item({required String title,required Color color,required Color textColor}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:2.w),
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(child: Text(title.translate,style:TextStyle(fontSize: 10.sp,color: textColor,height:1.9),),),
    );
  }
}

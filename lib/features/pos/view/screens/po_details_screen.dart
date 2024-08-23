import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/features/pos/model/po_details_model.dart';
import 'package:risal_customer/features/pos/viewModel/po_details_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../more/view/items/more_wite_container.dart';

class PoDetailsScreen extends StatefulWidget  {
  final int poId;
   PoDetailsScreen({required this.poId,super.key});

  @override
  State<PoDetailsScreen> createState() => _PoDetailsScreenState();
}

class _PoDetailsScreenState extends State<PoDetailsScreen>with  PoDetailsHelper {
  @override
  void initState() {
    opId=widget.poId;
    onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG_COLOR,
      body: Padding(
        padding:  EdgeInsets.only(top:7.h,bottom: 5.h,left:
        5.w,right: 5.w),
        child: StreamBuilder<PoDetailsDataModel?>(
          stream:detailsController.stream,
          builder: (context,snapshot) {
            return snapshot.hasData?Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
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
                    Expanded(flex: 2,child: Center(child: Text("#PO:${snapshot.data!.poNumber}"
                      ,style: TextStyle(fontSize: 16.sp,),))),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          _statusBadge(snapshot.data!.status??""),
                        ],
                      ),
                    )

                  ],),
                Expanded(child: ListView(children: [
                  Text("Delivery Details",style: TextStyle(fontSize: 14.sp,),),
                  SizedBox(height: 1.h,),
                  MoreWhiteContainer(
                    margin: EdgeInsets.zero,
                    body:item(icon: AppImages.PO_DETAILS_ADDRESS_IC,title:snapshot.data!.clientAddress??"No_delevery_address".translate) ,),
                  SizedBox(height: 2.h,),
                  ///==========================
                  Text("Delivery Service Details",style: TextStyle(fontSize: 14.sp,),),
                  SizedBox(height: 1.h,),
                  Column(
                    children: List.generate(snapshot.data!.orders!.length,(index){
                      return Column(
                        children: [
                          MoreWhiteContainer(
                            margin: EdgeInsets.zero,
                            body:Column(children: [
                              item(icon: AppImages.SERVICE_NAME_IC,title: snapshot.data!.orders![index].pOService.title),
                              item(icon: AppImages.SERVICE_QUANTITY_IC,title: "quantity".translate+snapshot.data!.orders![index].pOService.qty.toString()),
                              item(icon: AppImages.SERVICE_DURATION_IC,title: "duration".translate+snapshot.data!.orders![index].pOService.duration.toString())
                            ],) ,),
                          SizedBox(height:1.h)
                        ],
                      );
                    }),
                  ),
                  ///==========================
                  SizedBox(height: 2.h,),

                  Text("Payment Details",style: TextStyle(fontSize: 14.sp,),),
                  SizedBox(height: 1.h,),
                  MoreWhiteContainer(
                    margin: EdgeInsets.zero,
                    body:Column(children: [
                      item(icon: AppImages.POS_ITEM_TOTAL_IC,title: "Total".translate+snapshot.data!.poValue.toString()+" "+"SAR".translate),
                      item(icon: AppImages.POS_ITEM_DOWN_PAYMENT_IC,title: "down_payment".translate+snapshot.data!.downPaymentValue.toString()+" "+"SAR".translate)
                    ],) ,),
                  ///==========================
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: Text(
                      "chek_our".translate,
                      style: TextStyle(color: AppColors.GREY, fontWeight: FontWeight.w500, fontSize: 10.sp),
                    ),
                  ),
                  Center(
                    child: InkWell(
                        onTap: (){},
                        child: Text(
                          "terms_title_2".translate,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.BLACK, fontWeight: FontWeight.w500, fontSize: 10.sp,),
                        )),
                  ),
                  SizedBox(
                    height: 3.h,
                  )

                ],))

            ],):SizedBox();
          }
        ),
      ),
    );
  }

  Widget item({required String icon, required String title}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon,width:5.w,),
        SizedBox(width: 2.w,),
        Expanded(child:
        Text(title,style: TextStyle(fontSize:11.sp,fontWeight:FontWeight.w500),),),
      ],);
  }

  Widget _statusBadge(String status){
    bool isActive=status=="active";
    return Container(
      padding: EdgeInsets.symmetric(horizontal:2.w),
      decoration: BoxDecoration(
        color: status=="active"?AppColors.BLUE_LGIHT:AppColors.GREEN_LGIHT,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(child: Text((isActive?"active":"delivered").translate,style:TextStyle(fontSize: 10.sp,color: isActive?AppColors.BLUE:AppColors.GREEN,height:1.9),),),
    );
  }
}

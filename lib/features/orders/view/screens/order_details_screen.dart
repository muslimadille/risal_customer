import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_style.dart';
import 'package:risal_customer/common/widgets/costum_bottom_sheet.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/features/orders/model/order_details_model.dart';
import 'package:risal_customer/features/orders/view/items/recieve_order_bttom_sheet.dart';
import 'package:risal_customer/features/orders/viewModel/order_details_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../more/view/items/more_wite_container.dart';

class OrderDetailsScreen extends StatefulWidget  {
  final int orderId;
  OrderDetailsScreen({required this.orderId,super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen>with  OrderDetailsHelper {
  @override
  void initState() {
    orderId=widget.orderId;
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
        child: StreamBuilder<OrderDetailsDataModel?>(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: (){
                                  AppNavigator().goBack();
                                },
                                child: SvgPicture.asset(AppImages.BACK_BTN_IC,matchTextDirection: true,)),
                          ],
                        )),
                    Expanded(flex: 2,child: Center(child: Text("#PO:${snapshot.data!.pOService!.po!.poNumber}"
                      ,style: TextStyle(fontSize: 16.sp,height: 1),))),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          _statusBadge(snapshot.data!.status??"active"),
                        ],
                      ),
                    )

                  ],),
                  Expanded(child: ListView(children: [
                    Text("PO Details",style: TextStyle(fontSize: 14.sp,),),
                    SizedBox(height: 1.h,),
                    MoreWhiteContainer(
                      margin: EdgeInsets.zero,
                      body:item(icon: AppImages.SERVICE_QUANTITY_IC,title:"#PO:${snapshot.data!.pOService!.po!.poNumber}") ,),
                    SizedBox(height: 2.h,),
                    ///==========================
                    Text("Delivery Details",style: TextStyle(fontSize: 14.sp,),),
                    SizedBox(height: 1.h,),
                    MoreWhiteContainer(
                      margin: EdgeInsets.zero,
                      body:item(icon: AppImages.PO_DETAILS_ADDRESS_IC,title:snapshot.data!.po!.clientAddress??"No_delevery_address".translate) ,),
                    SizedBox(height: 2.h,),
                    ///==========================
                    Text("Delivery Service Details",style: TextStyle(fontSize: 14.sp,),),
                    SizedBox(height: 1.h,),
                    Column(
                      children: List.generate(1,(index){
                        return Column(
                          children: [
                            MoreWhiteContainer(
                              margin: EdgeInsets.zero,
                              body:Column(children: [
                                item(icon: AppImages.SERVICE_NAME_IC,title: snapshot.data!.pOService!.title??""),
                                item(icon: AppImages.SERVICE_QUANTITY_IC,title: "quantity".translate+((snapshot.data!.pOService!.qty??0).toString())),
                                item(icon: AppImages.SERVICE_DURATION_IC,title: "duration".translate+(snapshot.data!.pOService!.duration??""))
                              ],) ,),
                            SizedBox(height:1.h)
                          ],
                        );
                      }),
                    ),


                    ///==========================
                    SizedBox(
                      height: 3.h,
                    ),


                  ],)),
                  CustomBtn(
                    title: 'receive_service_btn'.translate,
                    style: AppStyle.BTN_STYLE,
                    onClick: (){
                      CustomBottomSheet().displayModalBottomSheet(
                        isDismiss: true,
                          widget: RecieveOrderBottomSheet(
                        onDone: ()async{
                        receiveOrder();
                      },));
                    },
                  ),
                  SizedBox(height: 1.h,),
                  CustomBtn(
                    title: 'report_issue_btn'.translate,
                    style: AppStyle.BORDER_BTN_STYLE,
                    textStyle:TextStyle(
                        color: AppColors.BLUE_DARK,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp) ,
                    onClick: (){

                    },
                  )

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


import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/widgets/search_widget.dart';
import 'package:risal_customer/features/orders/model/orders_list_model.dart';
import 'package:risal_customer/features/orders/view/items/orders_filtter_buttom_sheet.dart';
import 'package:risal_customer/features/orders/view/items/orders_list_item.dart';
import 'package:risal_customer/features/orders/viewModel/orders_list_helper.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/view/items/pos_filtter_buttom_sheet.dart';
import 'package:risal_customer/features/pos/view/items/pos_list_item.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/widgets/costum_bottom_sheet.dart';
import '../../../../common/widgets/filtter_btn_widget.dart';


class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen>with OrdersListHelper {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6.h,),
        Text("orders_screen_title".translate,textAlign: TextAlign.center,style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w800 ),),
          SizedBox(height: 4.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:6.w),
            child: Row(
              children: [
                Expanded(
                  child: SearchWidget(onClick: (value)async{
                    currentPage=1;
                    posListFilters["order_id"]=value;
                    await getPosList();
                  },),
                ),
                SizedBox(width: 2.w,),
                FiltterBtnWidget(onClick: (){
                  CustomBottomSheet().displayModalBottomSheet(widget: OrdersFiltterBottomSheet(onDone: (value)async{
                    currentPage=1;
                    if(value!=null){
                      posListFilters["status"]=value;
                  }else {
                      posListFilters["status"]=null;
                    }
                    await getPosList();
                  },selectedValue: posListFilters["status"],));
                },)
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          Expanded(child: StreamBuilder<List<OrderModel>>(
              stream: posListState.stream,
              builder:(context,snapshot) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                itemCount:posList.length,
                  separatorBuilder: (ctx,index){
                  return SizedBox(height: 1.h,);
                  },
                  itemBuilder: (ctx,index){
                return OrderListItem(orderModel:posList[index],onClick: (){
                  AppNavigator().push(routeName: AppRoutes.ORDER_DETAILS_SCREEN_ROUT,arguments:posList[index].id);
                },);
              });
            }
          ))


      ],),
    );
  }
}

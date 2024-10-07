
import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/widgets/search_widget.dart';
import 'package:risal_customer/features/orders/model/orders_list_model.dart';
import 'package:risal_customer/features/orders/model/request_pos_list_model.dart';
import 'package:risal_customer/features/orders/view/items/orders_filtter_buttom_sheet.dart';
import 'package:risal_customer/features/orders/view/items/orders_list_item.dart';
import 'package:risal_customer/features/orders/viewModel/requests_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/widgets/costum_bottom_sheet.dart';
import '../../../../common/widgets/filtter_btn_widget.dart';
import '../items/add_requests_bottom_sheet.dart';


class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen>with RequestsHelper {
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
      floatingActionButton: IconButton(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        onPressed: (){
          CustomBottomSheet().displayModalBottomSheet(
              widget: AddRequestBottomSheet(onDone: (value)async{
                await addRequest(value??{});
          },selectedValue: null,));
        },icon: Icon(Icons.add_circle,color: Colors.red,size:15.w,),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6.h,),
          Text("requests_tab".translate,textAlign: TextAlign.center,style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w800 ),),
          SizedBox(height: 4.h,),

          Expanded(child: StreamBuilder<List<OrderModel>>(
              stream: requestsListState.stream,
              builder:(context,snapshot) {
                return snapshot.hasData?ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    itemCount:3,
                    separatorBuilder: (ctx,index){
                      return SizedBox(height: 1.h,);
                    },
                    itemBuilder: (ctx,index){
                      return   OrderListItem(orderModel:posList[index],onClick: (){
                        AppNavigator().push(routeName: AppRoutes.ORDER_DETAILS_SCREEN_ROUT,arguments:posList[index].id);
                      },);
                    }):SizedBox();
              }
          ))


        ],),
    );
  }
}

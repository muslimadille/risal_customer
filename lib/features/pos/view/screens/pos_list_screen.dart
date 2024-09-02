
import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/common/utils/app_routes.dart';
import 'package:risal_customer/common/widgets/no_data_widget.dart';
import 'package:risal_customer/common/widgets/search_widget.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/view/items/pos_filtter_buttom_sheet.dart';
import 'package:risal_customer/features/pos/view/items/pos_list_item.dart';
import 'package:risal_customer/features/pos/viewModel/pos_list_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/widgets/costum_bottom_sheet.dart';
import '../../../../common/widgets/filtter_btn_widget.dart';


class PosListScreen extends StatefulWidget {
  const PosListScreen({super.key});

  @override
  State<PosListScreen> createState() => _PosListScreenState();
}

class _PosListScreenState extends State<PosListScreen>with PosListHelper {
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
        Text("pos_screen_title".translate,textAlign: TextAlign.center,style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w800 ),),
          SizedBox(height: 4.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:6.w),
            child: Row(
              children: [
                Expanded(
                  child: SearchWidget(onClick: (value)async{
                    currentPage=1;
                    posListFilters["po_number"]=value;
                    await getPosList();
                  },),
                ),
                SizedBox(width: 2.w,),
                FiltterBtnWidget(onClick: (){
                  CustomBottomSheet().displayModalBottomSheet(widget: PosFiltterButtomSheet(onDone: (value)async{
                    currentPage=1;
                    if(value!=null){
                      posListFilters["status"]=value??"";
                  }else {
                      posListFilters["status"]=null;
                    }
                    await getPosList();
                  },selectedValue: posListFilters["status"],));
                },)
              ],
            ),
          ),
          Expanded(child: StreamBuilder<List<PoModel>>(
              stream: posListState.stream,
              builder:(context,snapshot) {
              return snapshot.hasData?
                posList.isEmpty?NoDataWidget(title: "no_pos_found".translate, icon: AppImages.POS_TAB_IC):ListView.separated(
                itemCount:posList.length,
                  separatorBuilder: (ctx,index){
                  return SizedBox(height: 1.h,);
                  },
                  itemBuilder: (ctx,index){
                return InkWell(
                  onTap: (){
                    AppNavigator().push(routeName: AppRoutes.POS_DETAILS_SCREEN_ROUT,arguments:posList[index].id );
                  },
                    child: PosListItem(poModel:posList[index],));
              }):
              SizedBox();
            }
          ))


      ],),
    );
  }
}

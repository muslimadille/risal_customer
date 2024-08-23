import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:risal_customer/features/home_tabs_screen/view/items/home_tab_item.dart';
import 'package:risal_customer/features/home_tabs_screen/view_model/home_tabs_helper.dart';
import 'package:sizer/sizer.dart';


class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({ this.selectedIndex,super.key});
  final int? selectedIndex;

  @override
  State<HomeTabsScreen> createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> with HomeTabsHelper {

  @override
  void initState() {
    onInit(widget.selectedIndex??0);
    super.initState();
  }
  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;

      },
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: AppColors.BG_COLOR,
        body:ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, value, child){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Expanded(child: screens[value]),
              Container(
                width:  double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 4.w),
                margin:EdgeInsets.symmetric(horizontal: 6.w) ,
                decoration:const BoxDecoration(
                  color: AppColors.WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow:[
                    BoxShadow(
                      color:AppColors.GREY,
                      blurRadius: 24,
                      spreadRadius: 0
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:[
                    HomeTabItem(onClick:(){
                      if(value!=0){
                        selectedIndex.value=0;
                      }
                    }, isSelected:value==0, title:'pos_tab'.translate, icon:AppImages.POS_TAB_IC,),
                    HomeTabItem(onClick:(){
                      if(value!=1){
                        selectedIndex.value=1;
                      }
                    }, isSelected:value==1, title:'orders_tab'.translate, icon:AppImages.ORDERS_TAB_IC,),
                    HomeTabItem(onClick:(){
                      if(value!=2){
                        selectedIndex.value=2;
                      }
                    }, isSelected:value==2, title:'more_tab'.translate, icon:AppImages.MORE_TAB_IC,)
                  ],
                ),
              ),
              SizedBox(height: 3.h,)
            ],);
          }
        ),
      ),
    );
  }
}

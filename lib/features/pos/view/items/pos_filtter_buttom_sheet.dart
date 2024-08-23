import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_dropdown_widget.dart';
import 'package:sizer/sizer.dart';

class PosFiltterButtomSheet extends StatefulWidget {
  final Function(String? value) onDone;
  String? selectedValue;


   PosFiltterButtomSheet({
    required this.onDone,
     this.selectedValue,
    super.key});

  @override
  State<PosFiltterButtomSheet> createState() => _PosFiltterButtomSheetState();
}

class _PosFiltterButtomSheetState extends State<PosFiltterButtomSheet> {
  List<CustomDropDownModel> options=[
    CustomDropDownModel(title: "active".translate,item:"active".translate ),
    CustomDropDownModel(title: "delivered".translate,item:"delivered".translate )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        height: 30.h,
        decoration:const BoxDecoration(
            color: AppColors.WHITE,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),

        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h,),
          Padding(
          padding:  EdgeInsets.symmetric(horizontal:4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("filter".translate,style: TextStyle(fontSize:16.5.sp,fontWeight: FontWeight.w700 ),),
            Visibility(
              visible: (widget.selectedValue??"").isNotEmpty,
              child: InkWell(
                onTap: (){
                  widget.selectedValue=null;
                  setState(() {
                    AppNavigator().goBack();
                    widget.onDone(widget.selectedValue);
                  });
                },
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal:2.w,vertical:2.w),
                  decoration:const BoxDecoration(
                      color: AppColors.WHITE,
                      borderRadius: BorderRadius.all(Radius.circular(12),),
                        border: const Border.fromBorderSide(
                            BorderSide(
                                width:1,
                                color:AppColors.BLUE_DARK
                            )
                        )
                    ),
                  child:
                  Center(child: Text("clear_filter_bt_title".translate,style: TextStyle(color: AppColors.BLUE_DARK,fontSize:12.5.sp),),),),
              ),
            )
          ],),
        ),
          SizedBox(height: 1.5.h,),
          Padding(
          padding:  EdgeInsets.symmetric(horizontal:4.w),
          child: Text("STATUS".translate,style:TextStyle(fontSize:12.5.sp) ,),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:4.w),
          child: CustomDropDown(
            title: "select_satus".translate,
            items: options,
            onSelect: (item){
              widget.selectedValue=item.title;
              setState(() {
              });
            },selectedValue:null
            ),
        ),
        SizedBox(height: 3.h,),
        CustomBtn(onClick: (){
          AppNavigator().goBack();
          widget.onDone(widget.selectedValue);
        }, title: "DONE".translate)
      ],),
    );
  }
}

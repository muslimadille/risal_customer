import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/widgets/custom_btn.dart';
import 'package:risal_customer/common/widgets/custom_dropdown_widget.dart';
import 'package:risal_customer/common/widgets/custom_text_field.dart';
import 'package:risal_customer/common/widgets/date_picker_widget.dart';
import 'package:risal_customer/features/orders/model/request_pos_list_model.dart';
import 'package:risal_customer/features/orders/model/request_services_list_model.dart';
import 'package:risal_customer/features/orders/repo/orders_repo.dart';
import 'package:risal_customer/features/orders/viewModel/requests_helper.dart';
import 'package:sizer/sizer.dart';

class AddRequestBottomSheet extends StatefulWidget {
  final Function(Map<String,dynamic>? value) onDone;
  Map<String,dynamic>? selectedValue;


  AddRequestBottomSheet({
    required this.onDone,
    this.selectedValue,
    super.key});

  @override
  State<AddRequestBottomSheet> createState() => _AddRequestBottomSheetState();
}

class _AddRequestBottomSheetState extends State<AddRequestBottomSheet> with RequestsHelper{
  TextEditingController  quantityController=TextEditingController();

  @override
  void initState() {
    if(widget.selectedValue==null){
      widget.selectedValue={};
    }
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
    return Container(
      width: double.infinity,
      height: 66.h,
      decoration:const BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),

      ),
      child: ListView(
        children: [
          SizedBox(height: 2.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.w),
            child:Text("add_order_request".translate,style: TextStyle(fontSize:16.5.sp,fontWeight: FontWeight.w700 ),),

          ),
          SizedBox(height: 1.5.h,),
          StreamBuilder<List<RequestPo>>(
            stream: posListState.stream,
            builder: (context, snapshot) {
              List<CustomDropDownModel> data=(snapshot.data??[]).isNotEmpty?
                  List.generate((snapshot.data??[]).length, (index){
                    return CustomDropDownModel(title: (snapshot.data??[])[index].poNumber,item: (snapshot.data??[])[index]);
                  })
                  :[];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:4.w),
                  child: Text("pos".translate,style:TextStyle(fontSize:12.5.sp) ,),
                ),
                Padding(
                    padding:  EdgeInsets.symmetric(horizontal:4.w),
                    child: CustomDropDown(
                        title: "select_po".translate,
                        items: data,
                        onSelect: (item){
                          widget.selectedValue!["po_id"]=item.item.id.toString();
                          getServicesList(item.item.id);
                        },selectedValue:null)
                ),
              ],);
            }
          ),
          SizedBox(height: 1.5.h,),
          StreamBuilder<List<RquestServiceModel>>(
              stream: servicesListState.stream,
              builder: (context, snapshot) {
                List<CustomDropDownModel> data=(snapshot.data??[]).isNotEmpty?
                List.generate((snapshot.data??[]).length, (index){
                  return CustomDropDownModel(title: (snapshot.data??[])[index].title,item: (snapshot.data??[])[index]);
                })
                    :[];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:4.w),
                      child: Text("service".translate,style:TextStyle(fontSize:12.5.sp) ,),
                    ),
                    Padding(
                        padding:  EdgeInsets.symmetric(horizontal:4.w),
                        child: CustomDropDown(
                            title: "select_service".translate,
                            items: data,
                            onSelect: (item){
                              widget.selectedValue!["po_service_id"]=item.item.id.toString();
                            },selectedValue:null)
                    ),
                  ],);
              }
          ),
          SizedBox(height: 1.5.h,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:4.w),
                child: Text("date".translate,style:TextStyle(fontSize:12.5.sp) ,),
              ),
              Padding(
                  padding:  EdgeInsets.symmetric(horizontal:4.w),
                  child: DatePickerWidget(onSelectDate: (date ) {
                    widget.selectedValue!["date"]=date;
                  },),
              ),
            ],),
          SizedBox(height: 1.5.h,),

          CustomTextField(
            title: "quantity",
            inputType: TextInputType.number,
            controller: quantityController,
            onChange: (value){
              widget.selectedValue!["qty"]=value;
            },
          ),

          SizedBox(height: 3.h,),
          CustomBtn(onClick: (){
            AppNavigator().goBack();
            widget.onDone(widget.selectedValue!);
          }, title: "DONE".translate)
        ],),
    );
  }

}

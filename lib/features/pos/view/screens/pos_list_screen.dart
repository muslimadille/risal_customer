
import 'package:flutter/material.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/features/pos/model/pos_list_model.dart';
import 'package:risal_customer/features/pos/view/items/pos_list_item.dart';
import 'package:risal_customer/features/pos/viewModel/pos_list_helper.dart';
import 'package:sizer/sizer.dart';

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
          ///search
          ///list body
          Expanded(child: ValueListenableBuilder<List<PoModel>>(
              valueListenable: posListState,
              builder:(context,snapshot,_) {
              return ListView.separated(
                itemCount:snapshot.length,
                  separatorBuilder: (ctx,index){
                  return SizedBox(height: 1.h,);
                  },
                  itemBuilder: (ctx,index){
                return PosListItem(poModel:snapshot[index],);
              });
            }
          ))


      ],),
    );
  }
}

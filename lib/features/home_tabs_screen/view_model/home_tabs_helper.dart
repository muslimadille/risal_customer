import 'package:flutter/material.dart';
import 'package:risal_customer/features/more/view/screens/more_screen.dart';

import '../../pos/view/screens/pos_list_screen.dart';



mixin HomeTabsHelper{
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);



  onInit(index){
    selectedIndex.value=index;

  }

  final List<Widget> screens=[
    PosListScreen(),
    Container(),
    MoreScreen(),
  ];







  void onClick({required int index}) {

  }

}
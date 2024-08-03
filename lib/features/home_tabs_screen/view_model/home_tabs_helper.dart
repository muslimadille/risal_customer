import 'package:flutter/material.dart';
import 'package:risal_customer/features/more/view/screens/more_screen.dart';


mixin HomeTabsHelper{
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);



  onInit(index){
    selectedIndex.value=index;

  }

  final List<Widget> screens=[
    Container(),
    Container(),
    MoreScreen(),
  ];







  void onClick({required int index}) {

  }

}
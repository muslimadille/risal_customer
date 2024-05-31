import 'package:flutter/material.dart';


mixin HomeTabsHelper{
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);



  onInit(index){
    selectedIndex.value=index;

  }

  final List<Widget> screens=[
    Container(),
    Container(),
    Container(),
  ];







  void onClick({required int index}) {

  }

}
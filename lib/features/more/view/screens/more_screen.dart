import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../items/more_item_widget.dart';
import '../items/more_white_container.dart';
import '../items/user_card_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 5.h,),
      const UserCardWidget(),
      SizedBox(height:2.h,),
      MoreWhiteContainer(body:MoreItemWidget(suffix: '', prefix: "", title: '', onClick: (){},) ,)
    ],);
  }
}

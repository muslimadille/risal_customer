import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:risal_customer/common/extentions/translat_extention.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';

class MoreItemWidget extends StatelessWidget {
  final String suffix,title;
  final bool? prefix;
  final Function onClick;

  const MoreItemWidget({super.key, required this.suffix, this.prefix, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Row(children: [
        SvgPicture.asset(suffix),
        SizedBox(width: 2.w,),
        Expanded(child: Text(title)),
        SizedBox(width: 2.w,),
        Visibility(
          visible:prefix??false,
            child: SvgPicture.asset(AppImages.MORE_ARROW_IC,matchTextDirection: true,)),
      ],),
    );

  }
}

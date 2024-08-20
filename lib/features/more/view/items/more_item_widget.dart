import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreItemWidget extends StatelessWidget {
  final String suffix,title;
  final String? prefix;
  final Function onClick;

  const MoreItemWidget({super.key, required this.suffix, this.prefix, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(suffix),
      Expanded(child: Text(title)),

      Visibility(
        visible:(prefix??"").isNotEmpty,
          child: SvgPicture.asset("")),
    ],);

  }
}

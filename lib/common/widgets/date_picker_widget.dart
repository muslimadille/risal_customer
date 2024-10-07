import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';
import 'package:risal_customer/common/utils/app_colors.dart';

import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';


class DatePickerWidget extends StatefulWidget {
  final Function(String) onSelectDate;
  const DatePickerWidget({required this.onSelectDate,super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        await onDateOfBirthClickAndroid();
      },
      child: Container(
        padding:EdgeInsets.symmetric(
            vertical:1.5.h,
            horizontal:4.w),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.fromBorderSide(
                BorderSide(
                  width:1,
                  color:AppColors.GREY,
                )
            )
        ),
        child: Row(children: [
          Expanded(child: Text(selectedDate==null?"select_date":selectedDate.toString())),


        ],),
      ),
    );
  }
  Future<void> onDateOfBirthClickAndroid() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? picked = await showDatePicker(
        context: AppNavigator().currentContext(),
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2100, 8));
    if (picked != null) {
      DateTime now = picked;
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);
      selectedDate=formattedDate;
      widget.onSelectDate(selectedDate??"");
      setState(() {

      });
    }
  }
}

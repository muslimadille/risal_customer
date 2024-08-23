import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:risal_customer/common/utils/app_colors.dart';
import 'package:risal_customer/common/utils/app_images.dart';
import 'package:sizer/sizer.dart';



class CustomDropDown extends StatefulWidget {
  final String title;
  final List<CustomDropDownModel>items;
  final CustomDropDownModel? selectedValue;
  final bool? isEnable;
  final Function(CustomDropDownModel model) onSelect;
  const CustomDropDown({
    required this.title,
    required this.items,
    required this.onSelect,
    required this.selectedValue,
    this.isEnable,
    Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<CustomDropDownModel>items=[];
  CustomDropDownModel? selectedValue;
  @override
  void didUpdateWidget(covariant CustomDropDown oldWidget) {
    items.clear();
    items.addAll(widget.items);
    if(widget.selectedValue!=null){
      selectedValue=items.where((element) => element.title==widget.selectedValue!.title).first;
    }
  }
  @override
  void initState() {
    items.clear();
    items.addAll(widget.items);
    if(widget.selectedValue!=null){
      selectedValue=items.where((element) => element.title==widget.selectedValue!.title).first;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
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
      padding:EdgeInsets.symmetric(
          vertical:1.5.h,
          horizontal:4.w),
      child: DropdownButton<CustomDropDownModel>(
        hint: Text(widget.title,style:TextStyle(
          fontFamily: GoogleFonts.getFont('Cairo').fontFamily,
            fontSize: 12.sp,color:Colors.grey,fontWeight:FontWeight.w500  )),
        isExpanded: true,
        isDense:true ,
        menuMaxHeight: 50.h,
        underline: SizedBox.shrink(),
        icon:SvgPicture.asset(AppImages.DROPDOWN_ARROW_IC,),
        style:TextStyle(
            fontFamily: GoogleFonts.getFont('Cairo').fontFamily,
            fontSize: 12.sp,color:Colors.black,fontWeight:FontWeight.w500  ),
        value: selectedValue,
        onChanged: (widget.isEnable??true)?(CustomDropDownModel? value) {
          widget.onSelect(value!);
          setState(() {
            selectedValue=value;
          });
        }:null,
        items: items
            .map<DropdownMenuItem<CustomDropDownModel>>((CustomDropDownModel value) {
          return DropdownMenuItem<CustomDropDownModel>(
            value: value,
            child: Text(value.title,style:TextStyle(fontSize: 12.sp,fontWeight:FontWeight.w500  )),
          );
        }).toList(),
      ),
    );
  }
}
class CustomDropDownModel{
  String title;
  dynamic? item;
  CustomDropDownModel({this.item,required this.title});

}

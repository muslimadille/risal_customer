import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:risal_customer/common/helpers/app_navigator.dart';

class CustomBottomSheet{

  static CustomBottomSheet? _instance;

  CustomBottomSheet._internal();

  factory CustomBottomSheet() {
    return _instance ??= CustomBottomSheet._internal();
  }

  void displayModalBottomSheet({
    bool ?isDismiss,
    double? fixedSize,
    required Widget widget,
    Color? color,
    double? radius
  }) {
    showModalBottomSheet(
        context: AppNavigator().currentContext(),
        isDismissible: isDismiss??true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: fixedSize,
            child:  Scaffold(
              backgroundColor: Colors.transparent,
              body:Column(
                children: [
                  const Expanded(
                    child:SizedBox() ,),
                  Container(
                      width: double.infinity,
                      decoration:BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(radius??0),
                        ),
                      ),
                      child: widget
                  )
                ],
              ),
            ),
          );
        });
  }
}
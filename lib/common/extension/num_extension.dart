import 'package:intl/intl.dart';

extension NumExtension on num {

  String currencyFormat(){
    final NumberFormat text = NumberFormat("#,##0.00");
    return text.format(this);
  }

  String currencyFormatWithOutDouble(){
    final NumberFormat text = NumberFormat("#,##0");
    return text.format(this);
  }

  String currencyCompatFormat(){
    final NumberFormat text = NumberFormat.compact();
    return text.format(this);
  }

}
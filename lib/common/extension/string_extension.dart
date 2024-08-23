extension StringExtension on String {

  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String hideBankNumber() {
    return '....${replaceRange(0, length-5,'')}';
  }

  String phoneNumberFormatter(){
    final String text = "${substring(0, 2)} ${substring(2, 5)} ${substring(5, 9)}";
    return text;
  }

}
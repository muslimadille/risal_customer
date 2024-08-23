
extension ValidatorsExtension on String {




  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isMatchedPassword({required String password}){
    return this==password;
  }



  bool isValidLength(int length) {
    return this.length==length;
  }



  bool isValidRegex(String regex){
  return RegExp(regex).hasMatch(this);
  }
}

import 'package:risal_customer/common/utils/app_constants.dart';

extension ValidatorsExtension on String {
  bool get isValidPhoneNumber {
    return RegExp(AppConstants.PHONE_SAUDI_NUMBER_PATTER).hasMatch(this);
  }

  bool get isValidPassword {
    return RegExp(AppConstants.PASSWORD_PATTERN).hasMatch(this);
  }

  bool get isValidEmail {
    return RegExp(AppConstants.EMAIL_PATTERN).hasMatch(this);
  }

  bool isMatchedPassword({required String password}){
    return this==password;
  }

  bool get isIdentityId {
    return RegExp(AppConstants.NATIONAL_SAUDI_ID_PATTERN).hasMatch(this);
  }

  bool isValidLength(int length) {
    return this.length==length;
  }

  bool get isValidIBAN {
    return length==24 && startsWith('SA');
  }

  bool isValidRegex(String regex){
  return RegExp(regex).hasMatch(this);
  }
}
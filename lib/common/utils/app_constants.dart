class AppConstants{
  static const String PHONE_SAUDI_NUMBER_PATTER = r'(^(5)(5|0|3|6|4|9|1|8|7|2)([0-9]{7})$)';
  static const String NATIONAL_SAUDI_ID_PATTERN = r"(^(1|2)([0-9]{9})$)";
  static const String EMAIL_PATTERN = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";
  static const String TEXT_PATTERN = r'(^[a-zA-Z ]*$)';
  static const String NAME_PATTERN = r'^(?![\s-])[a-zA-Z\u0621-\u064A]{2,}(?: [a-zA-Z\u0621-\u064A]+){0,}$';
  static const String ENGLISH_NAME_PATTERN = r'^(?![\s-])[a-zA-Z]{2,}(?: [a-zA-Z]+){0,}$';
  static const String PASSWORD_PATTERN = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~/#?!@$%^&*-]).{8,16}$';
  static const String IBAN_PATTERN = r'(^(SA)([a-zA-Z0-9]{22})$)';
  static const String DOUBLE_NUMBER_PATTERN = r'^\d*\.?\d{0,2}';
  static const String INTEGER_NUMBER_PATTERN = r'(?!0)^\d*';
  static const String BLOCK_SPACE_PATTERN = r'[^\s]';
}
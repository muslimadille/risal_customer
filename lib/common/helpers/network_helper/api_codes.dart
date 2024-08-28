
class ApiCodes {
  static const String SERVER_DEV = 'https://risal.topbits-tech.com/api/';
  static const String _SERVER_PROD = 'https://risal.topbits-tech.com/';
  static const String BASE_URL=SERVER_DEV;
  ///AUTH
  static const String LOGIN_API='user/login';
  static const String SEND_OTP_API='user/otp';
  static const String SET_PASSWORD_API='user/password-set';
  static const String LOGOUT_API='user/logout';
  /// FORGET PASSWORD
  static const String RESET_SEND_EMAIL='forget/email';
  static const String RESET_RESENND_OTP='resend/otp';
  static const String REST_VERIFY_OTP='reset/otp';
  static const String
  REST_SET_NEW_PASSWORD='reset/password';
  ///PROFILE
  static const String PROFILE_DATA='user/profile';
  static const String UPDATE_PASSWORD='user/password/update';

  /// pos
  static const String GET_POS_LIST_='user/pos';
  static const String GET_POS_details='user/pos/';//takes op id
 /// orders
  static const String GET_ORDERS_LIST='user/orders';
  static const String GET_ORDERS_DETAILS='user/order/';
  static const String REVIEVE_ORDER='user/receive/';
  static const String REPORT_ISSUE="user/report";
  /// Authers


























}



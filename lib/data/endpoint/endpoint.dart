class Endpoint {
  static const baseUrl = "https://api.staging.my-invoice.me/api/v1/";
  static const auth = "${baseUrl}auth/";

  static const register = "${auth}register/customer";
  static const login = "${auth}login/customer";
  static const verification = "${auth}verification/customer";
  static const resetPassword = "${auth}reset/password/request/customer";
}

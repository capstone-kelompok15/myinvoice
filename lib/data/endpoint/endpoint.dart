class Endpoint {
  static const baseUrl = "https://api.staging.my-invoice.me/api/v1/";
  static const auth = "${baseUrl}auth/";
  static const customer = "${baseUrl}customers/";

  static const register = "${auth}register/customer";
  static const login = "${auth}login/customer";
  static const verification = "${auth}verification/customer";
  static const resetPassword = "${auth}reset/password/request/customer";
  static const getCustomer = "${customer}me";
  static const updateFotoProfileCustomer = "${baseUrl}customers/me/picture";

  static const getInvoice = "${baseUrl}invoices";
}

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

  static const getInvoice = "${baseUrl}invoices/customers?limit=8&offset=0";

  static const getRecentBill = "${baseUrl}invoices/customers?limit=5&offset=0";

  static const getInvoiceById = "${baseUrl}invoices/";

  static const getSummary = "${baseUrl}customers/summaries";

  static const getNotification = "${baseUrl}customers/notifications?page=1&limit=99";
  static const getNotifCount = "${baseUrl}customers/notifications/unread_count";
  static const markAsRead = "${baseUrl}customers/notifications/";
}

class NotificationItem {
  final String? avatar;
  final String? title;
  final String? content;
  final String? datetime;
  final bool isRead;
  final String? status;
  final bool isPayment;
  final bool isInvoice;
  final bool isInfo;

  NotificationItem({
    this.avatar,
    this.title,
    this.content,
    this.datetime,
    this.isRead = true,
    this.status,
    this.isPayment = false,
    this.isInvoice = false,
    this.isInfo = false,
  });
}

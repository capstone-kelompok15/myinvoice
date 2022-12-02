class NotificationItem {
  final String? avatar;
  final String? title;
  final String? content;
  final String? datetime;
  final bool isRead;
  final String? type;

  NotificationItem({
    this.avatar,
    this.title,
    this.content,
    this.datetime,
    this.isRead = true,
    this.type,
  });
}

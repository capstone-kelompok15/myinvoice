import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/models/notification/notification_model.dart';
import 'package:myinvoice/models/notification/unread_count.dart';
import 'package:myinvoice/services/notification_service.dart';
import 'package:myinvoice/view/styles/styles.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationData? _notification;

  NotificationData? get notification => _notification;

  getAllNotification() async {
    final response = await NotificationServices().fetchAllNotification();
    _notification = response;
    notifyListeners();
  }

  UnreadNotifCount? _unreadCount;

  UnreadNotifCount? get unreadCount => _unreadCount;

  getUnreadCount() async {
    final response = await NotificationServices().fetchNotifCount();
    _unreadCount = response;
    notifyListeners();
  }

  markAsRead(String id) async {
    final response = await NotificationServices().markAsRead(id);
    _notification = response;
    notifyListeners();
  }
}

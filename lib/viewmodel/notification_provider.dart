import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/models/notification_model.dart';
import 'package:myinvoice/view/styles/styles.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationItem> _notifItems = [
    NotificationItem(
      title: 'Payment Received',
      content: 'Your payment has been received by Pulsa Cell',
      datetime: 'Nov 30, 2022',
      isRead: false,
      type: "payment",
    ),
    NotificationItem(
      title: '[nama_toko] has sent you an invoice',
      content: 'You have a new invoice from Pulsa Cell',
      datetime: 'Nov 30, 2022',
      isRead: true,
      type: "invoice",
    ),
    NotificationItem(
      title: 'Payment is Due Soon',
      content: 'Your payment on Pulsa Cell will due tomorrow',
      datetime: 'Nov 30, 2022',
      isRead: true,
      type: 'info',
    ),
    NotificationItem(
      title: 'You need verification',
      content: 'Your account needs to be verified by admin',
      datetime: 'Nov 30, 2022',
      isRead: false,
      type: 'info',
    ),
  ];

  List<NotificationItem> get notifItems => _notifItems;

  void markAsRead(int index) {
    _notifItems[index].isRead = true;
    notifyListeners();
  }
}

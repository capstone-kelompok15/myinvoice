import 'package:flutter/material.dart';
import 'package:myinvoice/models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  bool isPayment = false;
  bool isInvoice = false;
  bool isInfo = false;
  notifIcon(bool status) {
    if (status = isPayment) {
      return 'assets/icons/payment.svg';
    } else if (status = isInvoice) {
      return 'assets/icons/invoice.svg';
    } else if (status = isInfo) {
      return 'assets/icons/info.svg';
    }
  }

  List<NotificationItem> _notifItems = [
    NotificationItem(
      avatar: 'assets/icons/home_filled.svg',
      title: 'Payment Received',
      content: 'Your payment has been received by Pulsa Cell',
      datetime: 'Nov 30, 2022',
      isRead: true,
      isPayment: true,
    ),
    NotificationItem(
      avatar: 'assets/icons/home_filled.svg',
      title: 'Payment Received',
      content: 'Your payment has been received by Pulsa Cell',
      datetime: 'Nov 30, 2022',
      isRead: true,
      isPayment: true,
    ),
    NotificationItem(
      avatar: 'assets/icons/chat_outlined.svg',
      title: 'Payment Received',
      content: 'You have a new invoice from Pulsa Cell',
      datetime: 'Nov 30, 2022',
      isRead: true,
      isInvoice: true,
    ),
    NotificationItem(
      avatar: 'assets/icons/chat_filled.svg',
      title: 'Payment Received',
      content: 'Your payment on Pulsa Cell will due tomorrow',
      datetime: 'Nov 30, 2022',
      isRead: true,
      isInfo: true,
    ),
  ];

  List<NotificationItem> get notifItems => _notifItems;
}

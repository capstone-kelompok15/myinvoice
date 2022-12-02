import 'package:flutter/material.dart';
import 'package:myinvoice/models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  notifIcon(String? type) {
    if (type == "isPayment") {
      return 'assets/icons/payment.svg';
    } else if (type == 'isInvoice') {
      return 'assets/icons/invoice.svg';
    } else if (type == 'isInfo') {
      return 'assets/icons/info.svg';
    }
  }

  List<NotificationItem> _notifItems = [
    // NotificationItem(
    //   avatar: 'assets/icons/payment.svg',
    //   title: 'Payment Received',
    //   content: 'Your payment has been received by Pulsa Cell',
    //   datetime: 'Nov 30, 2022',
    //   isRead: false,
    //   type: "isPayment",
    // ),
    // NotificationItem(
    //   avatar: 'assets/icons/invoice.svg',
    //   title: '[nama_toko] has sent you an invoice',
    //   content: 'You have a new invoice from Pulsa Cell',
    //   datetime: 'Nov 30, 2022',
    //   isRead: true,
    //   type: "isInvoice",
    // ),
    // NotificationItem(
    //   avatar: 'assets/icons/info.svg',
    //   title: 'Payment is Due Soon',
    //   content: 'Your payment on Pulsa Cell will due tomorrow',
    //   datetime: 'Nov 30, 2022',
    //   isRead: true,
    //   type: 'isInfo',
    // ),
  ];

  List<NotificationItem> get notifItems => _notifItems;
}

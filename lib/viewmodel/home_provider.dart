import 'package:flutter/widgets.dart';
import 'package:myinvoice/models/customer.dart';
import 'package:myinvoice/models/home_model/bill_model.dart';
import 'package:myinvoice/services/customer_services.dart';

class HomeProvider extends ChangeNotifier {
  List<RecentItem> _recentList = [
    RecentItem(
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Paid',
    ),
    RecentItem(
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Paid',
    ),
    RecentItem(
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Unpaid',
    ),
    RecentItem(
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Pending',
    ),
  ];

  List<RecentItem> _dataPaid = [];
  List<RecentItem> _dataUnpaid = [];
  List<RecentItem> _dataPending = [];

  List<RecentItem> get dataPaid => _dataPaid;
  List<RecentItem> get dataUnpaid => _dataUnpaid;
  List<RecentItem> get dataPending => _dataPending;

// function untuk mengfilter invoice paid,pending dan unpaid untuk sementara karna masih data dummy
  filterInvoice() {
    _dataPaid = [];
    _dataUnpaid = [];
    _dataPending = [];
    for (var item in _recentList) {
      if (item.status == 'Paid') {
        _dataPaid.add(item);
      } else if (item.status == 'Unpaid') {
        _dataUnpaid.add(item);
      } else if (item.status == 'Pending') {
        _dataPending.add(item);
      }
    }
    notifyListeners();
  }

  List<RecentItem> get recentList => _recentList;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void ontap(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

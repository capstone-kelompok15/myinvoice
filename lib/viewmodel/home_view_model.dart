import 'package:flutter/widgets.dart';
import 'package:myinvoice/models/home_model/bill_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<RecentItem> _recentList = [
    RecentItem(
      avatar: 'assets/icons/home_filled.svg',
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Paid',
    ),
    RecentItem(
      avatar: 'assets/icons/home_filled.svg',
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Paid',
    ),
    RecentItem(
      avatar: 'assets/icons/home_filled.svg',
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Unpaid',
    ),
    RecentItem(
      avatar: 'assets/icons/home_filled.svg',
      merchantName: 'Amazon',
      date: 'Nov 30, 2022',
      bill: 500000,
      status: 'Pending',
    ),
  ];

  List<RecentItem> get recentList => _recentList;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void ontap(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

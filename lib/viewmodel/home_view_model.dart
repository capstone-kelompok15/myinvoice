import 'package:flutter/widgets.dart';
import 'package:myinvoice/models/home_model/bill_model.dart';
import 'package:myinvoice/view/screens/home/home/home_page.dart';
import 'package:myinvoice/view/screens/invoice/invoice_page.dart';
import 'package:myinvoice/view/screens/profile/profile_page.dart';
import 'package:myinvoice/view/screens/report/report_page.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Widget> _pages = [
    HomePage(),
    InvoicePage(),
    // Center(
    //   child: Text("Report"),
    // ),
    ReportPage(),
    ProfilePage(),
  ];
  List<Widget> get pages => _pages;

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
}

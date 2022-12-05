import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';

class RecentItem {
  final String? avatar;
  final String? merchantName;
  final String? date;
  final int? bill;
  final String? status;

  RecentItem({
    this.avatar,
    this.merchantName,
    this.date,
    this.bill,
    this.status,
  });
}

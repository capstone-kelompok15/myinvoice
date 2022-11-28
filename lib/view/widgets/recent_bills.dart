// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';

class RecentBills extends StatelessWidget {
  final String? merchantName;
  final String? dueDate;
  final String? bill;
  final bool isPaid;

  const RecentBills({
    Key? key,
    this.merchantName,
    this.dueDate,
    this.bill,
    this.isPaid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: netralCardColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(14, 31, 53, 0.12),
                offset: Offset.fromDirection(1.5, 4),
                blurRadius: 7,
              ),
            ],
          ),
          child: ListTile(
            leading: SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  iconHomeFilled,
                  color: Color(0xff404040),
                  width: 20,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  merchantName ?? "Merchant Name",
                  style: sectionHead.copyWith(color: primaryText),
                ),
                Text(
                  bill ?? "Bills",
                  style: sectionHead.copyWith(
                      color: primaryText, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dueDate ?? "Due Date",
                  style: sectionSubHead.copyWith(
                    color: Color(0xff999999),
                  ),
                ),
                Text(
                  isPaid ? 'Paid' : 'Unpaid',
                  style: sectionSubHead.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isPaid ? greenColor : redColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

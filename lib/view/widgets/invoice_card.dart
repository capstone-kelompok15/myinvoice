// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/models/home_model/bill_model.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class InvoiceCard extends StatelessWidget {
  final RecentItem recentItem;
  const InvoiceCard({
    Key? key,
    required this.recentItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);

    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        tileColor: netralCardColor,
        leading: SizedBox(
          width: 40,
          height: 40,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/icons/home_filled.svg',
              color: const Color(0xff404040),
              width: 20,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              recentItem.merchantName ?? '-',
              style: sectionHead.copyWith(color: primaryText),
            ),
            Text(
              idrFormat.format(recentItem.bill),
              style: sectionHead.copyWith(
                  color: primaryText, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              recentItem.date!,
              style: sectionSubHead.copyWith(
                color: const Color(0xff999999),
              ),
            ),
            if (recentItem.status == 'Paid') ...[
              Text(
                recentItem.status!,
                style: body4.copyWith(
                  color: greenColor,
                ),
              ),
            ] else if (recentItem.status == 'Unpaid') ...[
              Text(
                recentItem.status!,
                style: body4.copyWith(
                  color: redColor,
                ),
              ),
            ] else if (recentItem.status == 'Pending') ...[
              Text(
                recentItem.status!,
                style: body4.copyWith(
                  color: orangeColor,
                ),
              ),
            ],
          ],
        ),
        onTap: () {},
      ),
    );
  }
}

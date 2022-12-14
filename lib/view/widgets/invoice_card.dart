// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/models/home_model/bill_model.dart';
import 'package:myinvoice/models/invoice.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_provider.dart';
import 'package:provider/provider.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    Key? key,
    required this.merchant,
    required this.totalPrice,
    required this.createAt,
    required this.status,
  }) : super(key: key);

  final String merchant;
  final int totalPrice;
  final String createAt;
  final String status;

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeProvider>(context);

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
              merchant,
              style: sectionHead.copyWith(color: primaryText),
            ),
            Text(
              idrFormat.format(totalPrice),
              style: sectionHead.copyWith(
                  color: primaryText, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              createAt,
              style: sectionSubHead.copyWith(
                color: const Color(0xff999999),
              ),
            ),
            if (status == 'Paid') ...[
              Text(
                status,
                style: body4.copyWith(
                  color: greenColor,
                ),
              ),
            ] else if (status == 'Unpaid') ...[
              Text(
                status,
                style: body4.copyWith(
                  color: redColor,
                ),
              ),
            ] else if (status == 'Pending') ...[
              Text(
                status,
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

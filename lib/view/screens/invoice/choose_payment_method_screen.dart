import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MethodHelper.buildAppBar(context, 'Chosse Payment Method',
          isCenter: false),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Bank Transfer (Manual Verification)',
              style: heading7.copyWith(color: blackTextColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const ChooseBankCard(icon: bni, namaBank: 'Bank BNI'),
            const ChooseBankCard(icon: bca, namaBank: 'Bank BCA'),
            const ChooseBankCard(icon: mandiri, namaBank: 'Bank Mandiri'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Payment Gateway (Automatic Verification)',
              style: heading7.copyWith(color: blackTextColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const ChooseBankCard(namaBank: 'Bank BNI', icon: bni)
          ],
        ),
      ),
    );
  }
}

class ChooseBankCard extends StatelessWidget {
  const ChooseBankCard({
    Key? key,
    required this.namaBank,
    required this.icon,
  }) : super(key: key);

  final String namaBank;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(
                width: 15,
              ),
              Text(
                namaBank,
                style: paragraph4.copyWith(color: Colors.black),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}

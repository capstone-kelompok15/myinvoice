import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/payment_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';

import '../../widgets/bank_card.dart';
import '../../widgets/item_desciption.dart';

class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({
    super.key,
  });
  // final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MethodHelper.buildAppBar(
        context,
        'Invoice Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name Store",
                    style: body3.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Jl. merpati bandung jawa barat',
                    style: paragraph4.copyWith(color: blackTextColor),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Invoice #44335',
                        style: paragraph4.copyWith(color: netralDisableColor),
                      ),
                      const Spacer(),
                      Text(
                        'Date Invoice: ',
                        style: paragraph4.copyWith(color: blackTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Name User',
                    style: body3.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email User',
                        style: paragraph4.copyWith(color: blackTextColor),
                      ),
                      const Spacer(),
                      Text(
                        'Date Invoice: ',
                        style: paragraph4.copyWith(color: blackTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Jl. merpati bandung jawa barat',
                    style: paragraph4.copyWith(color: blackTextColor),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const ItemDescription(),
              const ItemDescription(),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  _choosePayment(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: netralCardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Method Payment',
                        style: subhead2.copyWith(color: blackTextColor),
                      ),
                      const Spacer(),
                      Text(
                        'Choose',
                        style: paragraph4.copyWith(color: netralDisableColor),
                      ),
                      SvgPicture.asset(
                        arrow,
                        color: netralDisableColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: netralCardColor),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total Product',
                          style: heading7.copyWith(color: blackTextColor),
                        ),
                        const Spacer(),
                        Text(
                          'Text',
                          style: paragraph4.copyWith(color: blackTextColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sub Total',
                          style: heading7.copyWith(color: blackTextColor),
                        ),
                        const Spacer(),
                        Text(
                          'Text',
                          style: paragraph4.copyWith(color: blackTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes',
                    style: heading7.copyWith(color: noteTextColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'It was pleasure doing business with you',
                    style: heading7.copyWith(
                      color: noteTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Term & Conditions',
                    style: heading7.copyWith(color: noteTextColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Please make the payment by the due',
                    style: heading7.copyWith(
                      color: noteTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottom(false),
      extendBody: true,
    );
  }

  Future<dynamic> _choosePayment(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 11),
                  height: 3,
                  width: 85,
                  decoration: BoxDecoration(
                    color: blackTextColor,
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
              ),
              Text(
                'Choose Payment Method',
                style: heading3.copyWith(color: blackTextColor),
              ),
              const SizedBox(
                height: 18,
              ),
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
        );
      },
    );
  }

  Widget buildBottom(bool isPaid) {
    if (isPaid) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 14,
        ),
        child: RoundedButton(title: 'Download', press: () {}),
      );
    } else {
      return const PayNowCard();
    }
  }
}

class PayNowCard extends StatelessWidget {
  const PayNowCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      // color: Colors.red,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Total Bill',
                style: paragraph4.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                'IDR.',
                style: body4.copyWith(color: Colors.black),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFCDCDCD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 41.5, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                );
              },
              child: Text(
                'Pay Now',
                style: heading4.copyWith(color: blackTextColor),
              ))
        ],
      ),
    );
  }
}

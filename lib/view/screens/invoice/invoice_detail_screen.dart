import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/models/invoice.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/payment_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/invoice_provider.dart';

class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({
    super.key,
  });
  // final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);

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
              StoreAndNameDetailsCard(),
              ItemDescriptionCard(),
              MethodPaymentCard(),
              SizedBox(
                height: 16,
              ),
              TotalProduckCard(),
              SizedBox(
                height: 16,
              ),
              NoteCard(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottom(true),
      extendBody: true,
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
      return PayNowCard();
    }
  }
}

class StoreAndNameDetailsCard extends StatelessWidget {
  const StoreAndNameDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "invoice.data. ?? ''",
          style: body3.copyWith(color: blackTextColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'alamat',
          style: paragraph4.copyWith(color: blackTextColor),
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Invoice #{$invoice.invoiceId}',
          style: paragraph4.copyWith(color: netralDisableColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              '',
              style: body3.copyWith(color: blackTextColor),
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
          '',
          style: paragraph4.copyWith(color: blackTextColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              '',
              style: paragraph4.copyWith(color: blackTextColor),
            ),
            const Spacer(),
            Text(
              'Date Invoice: ',
              style: paragraph4.copyWith(color: blackTextColor),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
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
      padding: const EdgeInsets.only(left: 38, bottom: 8, right: 8),
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
                backgroundColor: primaryMain,
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
                    builder: (context) => PaymentScreen(),
                  ),
                );
              },
              child: Text(
                'Pay Now',
                style: heading4.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

class TotalProduckCard extends StatelessWidget {
  const TotalProduckCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: netralCardColor),
      child: Column(
        children: [
          // isPaid
          //     ? Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             children: [
          //               Text(
          //                 'Method Payment',
          //                 style: body4.copyWith(color: netralDisableColor),
          //               ),
          //               const Spacer(),
          //               Text(
          //                 'Text',
          //                 style: paragraph4.copyWith(color: netralDisableColor),
          //               ),
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 8,
          //           ),
          //         ],
          //       )
          //     : const SizedBox(),
          Row(
            children: [
              Text(
                'Total Product',
                style: body4.copyWith(color: netralDisableColor),
              ),
              const Spacer(),
              Text(
                '',
                style: paragraph4.copyWith(color: netralDisableColor),
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
                style: body4.copyWith(color: netralDisableColor),
              ),
              const Spacer(),
              Text(
                '',
                style: paragraph4.copyWith(color: netralDisableColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MethodPaymentCard extends StatelessWidget {
  const MethodPaymentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
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
                      margin: EdgeInsets.symmetric(vertical: 11),
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
                  SizedBox(
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
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: netralCardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              'Method Payment',
              style: body3.copyWith(color: blackTextColor),
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
    );
  }
}

class ItemDescriptionCard extends StatelessWidget {
  const ItemDescriptionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: backgroundCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Item Description',
                      style: body4.copyWith(color: netralDisableColor),
                    ),
                    const Spacer(),
                    Text(
                      "",
                      style: paragraph4.copyWith(color: netralDisableColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: body4.copyWith(color: netralDisableColor),
                    ),
                    const Spacer(),
                    Text(
                      "",
                      style: paragraph4.copyWith(color: netralDisableColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Price',
                      style: body4.copyWith(color: netralDisableColor),
                    ),
                    const Spacer(),
                    Text(
                      "",
                      style: paragraph4.copyWith(color: netralDisableColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Total',
                      style: body3.copyWith(color: netralDisableColor),
                    ),
                    const Spacer(),
                    Text(
                      "",
                      style: paragraph4.copyWith(color: netralDisableColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ],
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
              const SizedBox(
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/choose_payment_method_screen.dart';
import 'package:myinvoice/view/screens/invoice/confirm_payment_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';

import '../../widgets/rounded_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      'Catat kode pembayaran dan tagihan Anda, kemudian pergi ke mesin ATM Bersama/Mandiri/Prima yang terdekat.',
      'Masukkan kartu ke mesin ATM Bersama',
      'Pilih "Transaksi Lainnya"',
      'Pilih menu "Transfer"',
      'Pilih "Transfer ke Bank Lain"',
      'Masukkan kode Bank Mandiri (008) dan kode pembayaran Anda : 8335441937924',
      'Masukkan jumlah pembayaran',
      'Konfirmasi rincian anda akan tampil di layar, cek dan tekan "Ya" untuk melanjutkan.',
      'Transaksi selesai'
    ];
    return Scaffold(
      appBar: MethodHelper.buildAppBar(
        context,
        'Payment',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: const [
                  ChooseBankCard(namaBank: 'Mandiri', icon: mandiri),
                  SizedBox(
                    height: 20,
                  ),
                  CardCopiable(title: 'Account Number', number: '4435233423'),
                  SizedBox(
                    height: 15,
                  ),
                  CardCopiable(title: 'Total Amount', number: 'IDR. 2.661.000'),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Cara Pembayaran',
                      style: heading3.copyWith(color: blackTextColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'ATM    ',
                            style: heading4.copyWith(color: primaryBackground),
                          ),
                          TextSpan(
                            text: 'Mobile Banking    i-Banking',
                            style: heading4.copyWith(color: buttonDisable),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 9),
                      decoration: BoxDecoration(
                        color: netralCardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ATM BERSAMA / MANDIRI / PRIMA',
                            style: paragraph4.copyWith(color: blackTextColor),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return CaraPembayaranCard(
                                  count: (index + 1).toString(),
                                  title: data[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    RoundedButton(
                        title: 'Confirm Payment',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ConfirmPaymentScreen(),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaraPembayaranCard extends StatelessWidget {
  const CaraPembayaranCard({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$count. ",
          style: paragraph4.copyWith(color: blackTextColor),
        ),
        Expanded(
          child: Text(
            title,
            style: paragraph4.copyWith(color: blackTextColor),
          ),
        ),
      ],
    );
  }
}

class CardCopiable extends StatelessWidget {
  const CardCopiable({
    Key? key,
    required this.title,
    required this.number,
  }) : super(key: key);

  final String title, number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: paragraph4.copyWith(color: blackTextColor),
        ),
        Row(
          children: [
            Text(
              number,
              style: heading4.copyWith(color: blackTextColor),
            ),
            const Spacer(),
            Text(
              'Copy',
              style: heading7.copyWith(color: primaryMain),
            ),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('assets/icons/fi-rr-copy-alt.svg'),
          ],
        )
      ],
    );
  }
}

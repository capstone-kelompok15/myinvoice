import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/status_pembayaran_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MethodHelper.buildAppBar(context, 'Confirm Payment'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                title: 'Date Invoice',
                icon: calender,
                hint: '22-11-2022',
              ),
              CustomTextField(
                title: 'Nomor Invoice',
                icon: invoice1,
                hint: 'INV-00341212',
              ),
              CustomTextField(
                title: 'Name Customer',
                icon: potrait,
                hint: 'e.g. Novita Lia',
              ),
              CustomTextField(
                title: 'Total Payment',
                icon: money,
                hint: 'Rp. 2.200.000',
              ),
              const SizedBox(
                height: 4,
              ),
              RoundedButton(
                  title: 'Confirm',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StatusPembayaranScreen(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

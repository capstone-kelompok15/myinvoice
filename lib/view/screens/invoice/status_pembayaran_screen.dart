import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/home/home_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';

class StatusPembayaranScreen extends StatelessWidget {
  const StatusPembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSukses = false;
    return Scaffold(
      appBar: MethodHelper.buildAppBar(context, ''),
      body: isSukses == true
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SvgPicture.asset(suksespayment),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Transaction Success',
                    style: heading3.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Yes! Enjoy your bill, Don't",
                    style: subhead1.copyWith(color: blackTextColor),
                  ),
                  Text(
                    "forget to check on your history",
                    style: subhead1.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Spacer(),
                  RoundedButton(
                      title: 'Back to Home',
                      press: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false);
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 10,
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SvgPicture.asset(waitingConfirm),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Waiting for Confirmation',
                    style: heading3.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Yes! Enjoy your bill, Don't",
                    style: subhead1.copyWith(color: blackTextColor),
                  ),
                  Text(
                    "forget to check on your history",
                    style: subhead1.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Have a problem",
                    style: subhead1.copyWith(color: blackTextColor),
                  ),
                  Text(
                    "Call center My Invoice",
                    style: subhead1.copyWith(color: blackTextColor),
                  ),
                  Spacer(),
                  RoundedButton(
                      title: 'Back to Home',
                      press: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false);
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 20,
                  ),
                ],
              ),
            ),
    );
  }
}

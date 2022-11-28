import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';

class SuccessSignupScreen extends StatelessWidget {
  const SuccessSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: SvgPicture.asset(imageSuccessSignup),
              ),
              Text(
                "Yeay, your account has\n          been created",
                style: heading2,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "Sign In to continue your journey\n                  for your bills")
            ],
          ),
        ),
      ),
    );
  }
}

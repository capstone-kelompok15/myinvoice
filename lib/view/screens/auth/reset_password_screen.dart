import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isReset = false;

  void resetPassword() {
    setState(() {
      _isReset = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: _isReset ? _confirmation() : _resetPassword(),
        ),
      )),
    );
  }

  Column _confirmation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 200,
            width: 100,
            child: SvgPicture.asset(imageCheckbox),
          ),
        ),
        Text(
          "Check your email",
          style: heading1,
        ),
        Text(
          "An email been sent to your email address, Cla****@gmail.com",
          style: TextStyle(color: netralDisableColor),
        )
      ],
    );
  }

  Column _resetPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 300,
            width: 250,
            child: SvgPicture.asset(imageForgotPassword),
          ),
        ),
        Text(
          "Forget Password",
          style: heading1,
        ),
        const SizedBox(
          height: 18,
        ),
        const CustomTextField(
          title: "Email",
          hint: "example@gmail.com",
        ),
        const SizedBox(
          height: 18,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryMain, borderRadius: BorderRadius.circular(12)),
          child: TextButton(
              onPressed: () => resetPassword(),
              child: Text(
                "Reset Password",
                style: body1.copyWith(color: Colors.white),
              )),
        ),
      ],
    );
  }
}

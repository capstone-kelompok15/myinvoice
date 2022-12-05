import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:myinvoice/view/screens/auth/success_signup_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/auth_provider.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Consumer<AuthProvider>(builder: (context, state, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Enter code sent\nto your email",
                    style: heading1,
                  ),
                  Text(
                    "Already sent to email :",
                    style: TextStyle(color: netralDisableColor),
                  ),
                  Text(
                    state.emailSignUp ?? "example12345@gmail.com",
                    style: TextStyle(color: netralDisableColor),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 55,
                    keyboardType: TextInputType.number,
                    onSubmit: (value) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SuccessSignupScreen(),
                          ));
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

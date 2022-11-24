import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/auth/signin_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: SvgPicture.asset(imageSignUp),
                ),
              ),
              Text(
                "Sign Up",
                style: heading1,
              ),
              const SizedBox(
                height: 18,
              ),
              const CustomTextField(
                title: "Full Name",
                hint: "e.g Darryl Martine",
              ),
              const CustomTextField(
                title: "Email",
                hint: "example@gmail.com",
              ),
              const CustomTextField(
                isPassword: true,
                title: "Password",
                hint: "********",
              ),
              const CustomTextField(
                title: "Full Name",
                isPassword: true,
                hint: "********",
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryMain,
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Create Account",
                      style: body1.copyWith(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: TextStyle(color: netralDisableColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignInScreen(),
                        )),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: primaryMain),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

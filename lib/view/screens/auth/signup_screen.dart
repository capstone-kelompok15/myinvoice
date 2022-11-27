import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/auth/otp_screen.dart';
import 'package:myinvoice/view/screens/auth/signin_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const OtpScreen(),
          ));
    }
  }

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _fullname,
                      title: "Full Name",
                      hint: "e.g Darryl Martine",
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: _email,
                      title: "Email",
                      hint: "example@gmail.com",
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text)) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: _password,
                      isPassword: true,
                      title: "Password",
                      hint: "********",
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 8 || text.length > 16) {
                          return 'Password must be 8-16 characters';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: _confirmPassword,
                      title: "Confirm Password",
                      isPassword: true,
                      hint: "********",
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 8 || text.length > 16) {
                          return 'Password must be 8-16 characters';
                        }
                        if (text != _password.text) {
                          return 'Password doesnt match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
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
                    onPressed: () => _submit(context),
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
                          builder: (context) =>  SignInScreen(),
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

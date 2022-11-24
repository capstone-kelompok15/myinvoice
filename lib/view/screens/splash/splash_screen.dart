import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/auth/signup_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initSplash() {
    return Timer(
      const Duration(seconds: 1),
      () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const SignupScreen(),
            ));
      },
    );
  }

  @override
  void initState() {
    initSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: 200,
                  width: 250,
                  child: SvgPicture.asset(appLogo),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "Manage your bill\n  with one hand",
                    style: heading2.copyWith(fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

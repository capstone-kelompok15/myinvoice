// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myinvoice/data/pref.dart';
import 'package:myinvoice/models/auth/auth_response.dart';
import 'package:myinvoice/services/auth_services.dart';
import 'package:myinvoice/view/screens/auth/otp_screen.dart';
import 'package:myinvoice/view/screens/auth/signup_screen.dart';
import 'package:myinvoice/view/screens/auth/success_signup_screen.dart';
import 'package:myinvoice/view/screens/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  String? emailSignUp;

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    isLoading = true;
    notifyListeners();

    final result = await AuthService.signIn(email, password);
    if (result.statusCode == 200) {
      Pref.saveToken(result.data!['data']['access_token']);
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          result.data!['error']['message'] ?? "",
        ),
        backgroundColor: Colors.red,
      ));
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> signUp(
      BuildContext context, String name, String email, String password) async {
    isLoading = true;
    notifyListeners();
    final result = await AuthService.signUp(name, email, password);
    emailSignUp = email;
    if (result.statusCode == 201) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const OtpScreen(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.error!['message'] ?? ''),
        backgroundColor: Colors.red,
      ));
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> verifEmail(BuildContext context, String code) async {
    final result = await AuthService.verifEmail(emailSignUp ?? '', code);

    if (result.statusCode == 200) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const SuccessSignupScreen(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(result.error != null ? result.error!['message'] ?? '' : ''),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<bool> resetPassword(String email) async {
    final result = await AuthService.resetPassword(email);
    return result ?? false;
  }

  Future logut(BuildContext context) async {
    await Pref.removeToken();
    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => SignupScreen(),
        ),
        (route) => false);
  }
}

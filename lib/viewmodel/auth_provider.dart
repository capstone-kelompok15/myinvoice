// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myinvoice/data/pref.dart';
import 'package:myinvoice/services/auth_services.dart';
import 'package:myinvoice/services/invoice_service.dart';
import 'package:myinvoice/view/screens/auth/otp_screen.dart';
import 'package:myinvoice/view/screens/auth/signup_screen.dart';
import 'package:myinvoice/view/screens/auth/success_signup_screen.dart';
import 'package:myinvoice/view/screens/home/home_screen.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  String? emailSignUp;

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    isLoading = true;
    notifyListeners();

    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    InvoiceProvider p = Provider.of<InvoiceProvider>(context, listen: false);

    final result = await AuthService.signIn(email, password);
    if (result.statusCode == 200) {
      Pref.saveToken(result.data!['data']['access_token']);
      await profileProvider.getCustomer();
      await InvoiceServices().getAllInvoice();
      await InvoiceServices().getInvoice(1);

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
          builder: (context) => const SignupScreen(),
        ),
        (route) => false);
  }
}

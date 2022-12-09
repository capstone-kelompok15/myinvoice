import 'package:flutter/material.dart';
import 'package:myinvoice/models/auth/auth_model.dart';
import 'package:myinvoice/services/auth_services.dart';

class AuthProvider extends ChangeNotifier {

  bool isLoading = false;

  String? emailSignUp;
  Future<SignInResponse?> signIn(String email, String password) async {
    isLoading = true;
    notifyListeners();

    final response = await AuthService.signIn(email, password);
    

    isLoading = false;
    notifyListeners();

    return response;
  }

  Future<SignUpResponse?> signUp(
      String name, String email, String password) async {
    isLoading = true;
    notifyListeners();
    final result = await AuthService.signUp(name, email, password);
    emailSignUp = email;

    isLoading = false;
    notifyListeners();

    return result;
  }
}

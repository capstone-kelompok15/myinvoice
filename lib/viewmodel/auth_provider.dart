import 'package:flutter/material.dart';
import 'package:myinvoice/models/signin_response.dart';
import 'package:myinvoice/repository/api_repository.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<SignInResponse?> signIn(String email, String password) async {
    isLoading = true;
    notifyListeners();
    
    final response = await ApiRepository.signIn(email, password);

    isLoading = false;
    notifyListeners();

    return response;
  }
}

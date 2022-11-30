import 'package:myinvoice/models/signin_response.dart';

class ApiRepository {
  static Future<SignInResponse?> signIn(String email, String password) async {
    final initialUser = {
      "email": "example@gmail.com",
      "password": "123456",
    };

    final url = "https://example.com/api/signin";

    /// Ceritanya validasi user dari api
    await Future.delayed(const Duration(seconds: 1));
    print(initialUser['email']);
    print(email);
    print(initialUser['email'] == email); 

    // jika valid
    if (email == initialUser['email'] && password == initialUser['password']) {
      return SignInResponse(
          success: true,
          token: "eXS21NwGQ9JyyRcDL1sVosfAyUvsed1LguuiedUDfUU3d",
          message: "SignIn Successfully");
    }
    // jika invalid
    return SignInResponse(
        success: false,
        token: null,
        message: "Failed to SignIn, please check email or password");
  }
}

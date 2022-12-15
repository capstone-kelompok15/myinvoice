class SignInResponse {
  bool? success;
  String? token;
  String? message;

  SignInResponse({this.success, this.token, this.message});
}

class SignUpResponse {
  bool? success;

  String? message;
  SignUpResponse({this.success, this.message});
}

import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/models/auth/auth_response.dart';

class AuthService {
  static Future<SignInResponse> signIn(String email, String password) async {
    try {
      print(Endpoint.login);
      final res = await Dio().post(Endpoint.login,
          data: {"email": email, "password": password, "device_id": "1234333"});
      print(res.data);
      print(res.statusCode);

      return SignInResponse(
          statusCode: res.statusCode, data: res.data, error: res.data);
    } on DioError catch (e) {
      print(e.response!.data);

      if (e.response!.statusCode! > 500) {
        return SignInResponse(
          statusCode: e.response?.statusCode,
          data: {
            'error': {'message': 'Server error'}
          },
        );
      } else {
        return SignInResponse(
            statusCode: e.response?.statusCode,
            data: e.response?.data,
            error: e.response?.data);
      }
    }
  }

  static Future<SignUpResponse> signUp(
      String fullname, String email, String password) async {
    try {
      final res = await Dio().post(
        Endpoint.register,
        data: {"email": email, "password": password, "full_name": fullname},
      );

      print(res.data);
      print(res.statusCode);

      return SignUpResponse(
          statusCode: res.statusCode,
          data: res.data['data'],
          error: res.data['error']);
    } on DioError catch (e) {
      if (e.response!.statusCode! > 500) {
        return SignUpResponse(
            statusCode: e.response?.statusCode,
            error: {'message': 'Server error'});
      } else {
        return SignUpResponse(
            statusCode: e.response?.statusCode,
            data: e.response?.data.data['data'],
            error: e.response?.data.data['error']);
      }
    }
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/data/pref.dart';
import 'package:myinvoice/models/customer.dart';
import 'package:myinvoice/viewmodel/auth_provider.dart';

class CustomerServices {
  // function get data customer
  Future<Customer> getCustomer() async {
    try {
      print('asd');
      String? token = await Pref.getToken();

      var response = await Dio()
          .get('https://api.staging.my-invoice.me/api/v1/customers/me',
              options: Options(headers: {
                'accept': 'application/json',
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 401) {
        AuthProvider().signOut;
      }

      if (response.statusCode == 200) {
        Customer data = Customer.fromJson(response.data['data']);
        return data;
      } else {
        throw Exception('Data Gagal diambil');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future uploadImage(File file) async {
    String? token = await Pref.getToken();

    FormData formData = FormData.fromMap({
      'profile_picture':
          await MultipartFile.fromFile(file.path, filename: "image.jpg")
    });

    final response = await Dio().patch(
      Endpoint.updateFotoProfileCustomer,
      data: formData,
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    print(response.data);
  }

  Future updateProfileCustomer(String fullName, String adress) async {
    try {
      String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      var response = await Dio().put(
          'https://api.staging.my-invoice.me/api/v1/customers/me',
          data: {'full_name': fullName, 'address': adress},
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(response.data);
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}

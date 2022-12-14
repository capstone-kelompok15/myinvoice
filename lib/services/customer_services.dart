import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/data/pref.dart';
import 'package:myinvoice/models/customer.dart';

class CustomerServices {
  Future<Customer> getCustomer() async {
    try {
      String? token = await Pref.getToken();
      // print(token.toString());

      var response = await Dio()
          .get('https://api.staging.my-invoice.me/api/v1/customers/me',
              options: Options(contentType: 'application/json', headers: {
                'Authorization': 'Bearer $token',
              }));
      Customer data = Customer.fromJson(response.data['data']);
      return data;
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
}

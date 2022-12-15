import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/models/invoice.dart';

import '../data/pref.dart';

class InvoiceServices {
  Future<List<Invoice>> getAllInvoice() async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await Dio().get(
        Endpoint.getInvoice,
        options: Options(headers: headers),
      );

      // print(response.data);

      if (response.statusCode == 200) {
        var data = response.data['data']['invoices'];

        List<Invoice> invoices = [];

        for (var item in data) {
          invoices.add(Invoice.fromJson(item));
        }

        print('success $data');

        return invoices;
      } else {
        throw Exception('Data Gagal Diambil');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<Invoice> getInvoiceById(int id) async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await Dio().get(
        "${Endpoint.getInvoiceById}/$id/customers}",
        options: Options(headers: headers),
      );

      // print(response.data);

      if (response.statusCode == 200) {
        Invoice invoice = Invoice.fromJson(response.data);

        print('success $invoice');

        return invoice;
      } else {
        throw Exception('Data Gagal Diambil');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}

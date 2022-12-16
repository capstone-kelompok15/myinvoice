import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/models/bank_model.dart';
import 'package:myinvoice/models/home_model/report.dart';
import 'package:myinvoice/models/invoice.dart';
import 'package:myinvoice/models/invoice_detail_model.dart';

import '../data/pref.dart';

class InvoiceServices {
  // function get all invoice
  Future<List<Invoice>> getAllInvoice(int isPaid) async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await Dio().get(
        "${Endpoint.getInvoice}&payment_status_id=$isPaid",
        options: Options(headers: headers),
      );

      // print(response.data);

      if (response.statusCode == 200) {
        var data = response.data['data']['invoices'];

        List<Invoice> invoices = [];

        for (var item in data) {
          invoices.add(Invoice.fromJson(item));
        }

        return invoices;
      } else {
        throw Exception('Data Gagal Diambil');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

// function untuk get invoice berdasarkan id
  Future<InvoiceDetail> getInvoiceById(int id) async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await Dio().get(
        'https://api.staging.my-invoice.me/api/v1/invoices/$id/customers',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        var data = response.data['data'];

        InvoiceDetail invoiceDetail = InvoiceDetail.fromJson(data);
        // print('succes=.>>>> ' + invoiceDetail);
        return invoiceDetail;
      } else {
        throw Exception('Data Gagal Diambil');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

// function untuk mendapatkan list bank si merchant

    Future<List<BankModel>> getAllBank(int id) async {
      try {
        final String? token = await Pref.getToken();
        var headers = {
          'accept': 'application/json',
        };

        var response = await Dio().get(
          'https://api.staging.my-invoice.me/api/v1/merchants/$id/banks',
          options: Options(headers: headers),
        );

        // print(response.data);

        if (response.statusCode == 200) {
          var data = response.data['data'];
          List<BankModel> bankModel = [];

        for (var item in data) {
          bankModel.add(BankModel.fromJson(item));
        }
        print('susces');
        return bankModel;
      } else {
        throw Exception('Data Gagal Diambil');
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<void> confirmPaymentByid(int id, File file) async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await Dio().put(
        'https://api.staging.my-invoice.me/api/v1/invoices/$id/confirm',
        options: Options(headers: headers),
      );

      print('success 001');

      FormData formData = FormData.fromMap({
        'payment':
            await MultipartFile.fromFile(file.path, filename: "image.jpg")
      });

      final responseMultiPart = await Dio().patch(
        'https://api.staging.my-invoice.me/api/v1/invoices/$id/payments/upload',
        data: formData,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('success 002');

      // print(response.data);
      print(responseMultiPart.data);
      // print(response.statusCode);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  // Future uploadImage(File file, int id) async {
  //   String? token = await Pref.getToken();

  //   FormData formData = FormData.fromMap({
  //     'payment': await MultipartFile.fromFile(file.path, filename: "image.jpg")
  //   });

  //   final response = await Dio().patch(
  //     'https://api.staging.my-invoice.me/api/v1/invoices/$id/payments/upload',
  //     data: formData,
  //     options: Options(
  //       headers: {
  //         'accept': 'application/json',
  //         'Content-Type': 'multipart/form-data',
  //         'Authorization': 'Bearer $token',
  //       },
  //     ),
  //   );

  //   print(response.data);
  // }
}

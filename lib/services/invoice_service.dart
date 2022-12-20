import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/models/bank/bank_model.dart';
import 'package:myinvoice/models/home/report.dart';
import 'package:myinvoice/models/invoice/invoice_model.dart';
import 'package:myinvoice/models/invoice_detail/invoice_detail_model.dart';
import 'package:path_provider/path_provider.dart';

import '../data/pref.dart';

class InvoiceServices {
  // function get all invoice
  Future<List<Invoice>> getAllInvoice({int isPaid = -1}) async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      String path;

      if (isPaid == -1) {
        path = Endpoint.getRecentBill;
      } else {
        path = "${Endpoint.getInvoice}&payment_status_id=$isPaid";
      }

      var response = await Dio().get(
        path,
        options: Options(
          headers: headers,
        ),
      );

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

      print(responseMultiPart.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  //function untuk download invoice

  Future<bool> downloadInvoice(int id) async {
    try {
      final appDocDir = (await getExternalStorageDirectories(
        type: StorageDirectory.documents,
      ))!
          .first;
      String appDocPath = "${appDocDir.path}/$id-invoice.pdf";

      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/pdf',
        'Authorization': 'Bearer $token',
      };

      print(appDocPath);

      var response = await Dio().download(
        'https://api.staging.my-invoice.me/api/v1/invoices/$id/download',
        appDocPath,
        options: Options(headers: headers),
        onReceiveProgress: (received, total) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        },
      );

      print('Succes');

      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}

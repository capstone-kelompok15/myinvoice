import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';

class InvoiceServices {
  Future getInvoice() async {
    try {
      print('tes');
      var response = await Dio().get(Endpoint.getInvoice);
      print(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}

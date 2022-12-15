import 'package:dio/dio.dart';
import 'package:myinvoice/data/endpoint/endpoint.dart';
import 'package:myinvoice/viewmodel/auth_provider.dart';

class InvoiceServices {
  Future getInvoice() async {
    try {
      print('tes');
      var response = await Dio().get(Endpoint.getInvoice);
      if (response.statusCode == 401) { 
        AuthProvider().autoSignOut;
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
  
}

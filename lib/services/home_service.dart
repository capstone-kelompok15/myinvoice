import 'package:dio/dio.dart';
import 'package:myinvoice/data/pref.dart';
import 'package:myinvoice/models/home_model/report.dart';

class HomeService {
  Future<HomeReport> getReport() async {
    try {
      final String? token = await Pref.getToken();
      var headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final Response response = await Dio().get(
        'https://api.staging.my-invoice.me/api/v1/customers/summaries',
        options: Options(headers: headers),
      );

      HomeReport homeReport = HomeReport.fromJson(response.data);

      return homeReport;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}

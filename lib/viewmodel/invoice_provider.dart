import 'package:flutter/cupertino.dart';
import 'package:myinvoice/models/invoice_detail_model.dart';
import 'package:myinvoice/services/invoice_service.dart';

import '../models/invoice.dart';

class InvoiceProvider extends ChangeNotifier {
  // page controller untuk unpaid ama paid
  int currendIndex = 0;

  PageController pageController = PageController();

  void changePage(int currendIndex) {
    this.currendIndex = currendIndex;

    notifyListeners();
  }

  int currentIndexPembayaran = 0;

  PageController pageControllerPembayaran = PageController();

  void changePagePembayaran(int currentIndexPembayaran) {
    this.currentIndexPembayaran = currentIndexPembayaran;

    notifyListeners();
  }

  List<Invoice> _allInvoice = [];

  List<Invoice> get allInvoice => _allInvoice;

  Future<void> getAllinvoices() async {
    try {
      var inv = await InvoiceServices().getAllInvoice();
      _allInvoice = inv;
      notifyListeners();

      print('sukses');
    } catch (e) {
      throw Exception(e);
    }
  }

  // function untuk get Invoice detail by id

  // Data data = Data();

  Data data = Data();

  Future<void> getInvoiceDetail(int id) async {
    try {
      Data data = await InvoiceServices().getInvoice(id);
      this.data = data;
    } catch (e) {
      print(e);
    }
  }
}

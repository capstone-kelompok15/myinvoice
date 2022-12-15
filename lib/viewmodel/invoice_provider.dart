import 'package:flutter/cupertino.dart';
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

  List<Invoice> _invoice = [];

  List<Invoice> get invoice => _invoice;

  Future<void> getAllinvoices() async {
    try {
      var inv = await InvoiceServices().getAllInvoice();
      _invoice = inv;
      notifyListeners();

      print('sukses');
    } catch (e) {
      throw Exception(e);
    }
  }

  Invoice? _invoiceById;

  Invoice? get invoiceById => _invoiceById;

  Future<void> getInvoiceById(int id) async {
    try {
      var inv = await InvoiceServices().getInvoiceById(id);
      _invoiceById = inv;
      notifyListeners();
      print('sukses');
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:myinvoice/models/bank_model.dart';
import 'package:myinvoice/models/invoice_detail_model.dart';
import 'package:myinvoice/services/invoice_service.dart';
import 'package:myinvoice/view/constant/constant.dart';

import '../models/invoice.dart';

class InvoiceProvider extends ChangeNotifier {
  // page controller untuk unpaid ama paid
  int currendIndex = 0;

  int bill = 0;

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

  Future<void> getAllinvoices(int isPaid) async {
    try {
      var inv = await InvoiceServices().getAllInvoice(isPaid);
      _allInvoice = inv;
      notifyListeners();

      print('sukses');
    } catch (e) {
      throw Exception(e);
    }
  }

  String payment = 'Choose';
  String icon = '';

  String accountNumber = '';

  choosePayment(String payment, String icon, String accountNumber) {
    this.payment = payment;
    this.accountNumber = accountNumber;
    this.icon = icon;
    notifyListeners();
  }

// function untuk mengecek apakah bank tersedia atau tidak
  bool checkBakMerch(String codeBank, List<BankModel> bankModel) {
    for (var item in bankModel) {
      if (item.bankCode == codeBank) {
        return false;
      }
    }
    return true;
  }

  // function to get sub total

  Future getSubTotal(int data) async {
    bill = 0;
    Future.delayed(Duration(milliseconds: 300), () {
      bill = data;
      notifyListeners();
    });
  }
}

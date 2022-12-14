import 'package:flutter/cupertino.dart';
import 'package:myinvoice/models/invoice.dart';

class InvoiceProvider extends ChangeNotifier {
  bool isShow = false;
  void onClick() {
    isShow = !isShow;
    print(isShow);
    notifyListeners();
  }

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

  // final List<Invoice> _allInvoice = [

  // ];

  // List<Invoice> _dataPaid = [];
  // List<Invoice> _dataUnPaid = [];

  // List<Invoice> get allInvoice => _allInvoice;
  // List<Invoice> get dataPaid => _dataPaid;
  // List<Invoice> get dataUnPaid => _dataUnPaid;

  // filterInvoice() {
  //   _dataPaid = [];
  //   _dataUnPaid = [];
  //   for (var item in _allInvoice) {
  //     if (item.isPaid) {
  //       _dataPaid.add(item);
  //     } else {
  //       _dataUnPaid.add(item);
  //     }
  //   }
  //   notifyListeners();
  // }

}

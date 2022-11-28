import 'package:flutter/cupertino.dart';

class InvoiceProvider extends ChangeNotifier {
  int currendIndex = 0;

  PageController pageController = PageController();

  void changePage(int currendIndex) {
    this.currendIndex = currendIndex;

    print('val $currendIndex');
    notifyListeners();
  }
}

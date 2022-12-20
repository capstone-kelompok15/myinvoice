import 'package:flutter/cupertino.dart';
import 'package:myinvoice/models/customer/customer_model.dart';
import 'package:myinvoice/services/customer_services.dart';

class ProfileProvider extends ChangeNotifier {
  Customer customer = Customer();

  Future<bool> getCustomer() async {
    try {
      Customer customer = await CustomerServices().getCustomer();
      this.customer = customer;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

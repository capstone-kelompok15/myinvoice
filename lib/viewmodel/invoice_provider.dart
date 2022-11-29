import 'package:flutter/cupertino.dart';
import 'package:myinvoice/models/invoice.dart';

class InvoiceProvider extends ChangeNotifier {
  int currendIndex = 0;

  PageController pageController = PageController();

  void changePage(int currendIndex) {
    this.currendIndex = currendIndex;

    print('val $currendIndex');
    notifyListeners();
  }

  final List<Invoice> _allInvoice = [
    Invoice(
      storeName: 'Jaya Abadi',
      alamatStore: 'Jl. Jalan Andalas',
      invoiceID: '46824',
      userName: 'Abdul Basit',
      emailUser: 'abdulbasit@gmail.com',
      alamatUser: 'Jl. Tinumbu',
      dateInvoice: '01-03-2022',
      dateOverdue: '07-04-2022',
      items: [
        Item(
          itemDescription: 'Susu',
          quantity: '4',
          price: '50000',
          total: '20000',
        ),
        Item(
          itemDescription: 'Bubuk',
          quantity: '2',
          price: '30000',
          total: '60000',
        ),
        Item(
          itemDescription: 'Kasur',
          quantity: '1',
          price: '10000',
          total: '10000',
        ),
      ],
      totalProduct: '2',
      subtotal: '100000',
    ),
    Invoice(
      storeName: 'Mulia Emas',
      alamatStore: 'Jl. Vetran',
      invoiceID: '830242',
      userName: 'Sartika',
      emailUser: 'sartika@gmail.com',
      alamatUser: 'Jl. Anteto',
      dateInvoice: '21-06-2022',
      dateOverdue: '07-07-2022',
      items: [
        Item(
          itemDescription: 'Besi',
          quantity: '3',
          price: '3000',
          total: '9000',
        ),
        Item(
          itemDescription: 'Seng',
          quantity: '2',
          price: '10000',
          total: '20000',
        ),
      ],
      totalProduct: '2',
      subtotal: '100000',
    ),
    Invoice(
      storeName: 'Peduli Kasih',
      alamatStore: 'Jl. Tarakan',
      invoiceID: '40245',
      userName: 'Anggita',
      emailUser: 'anggita@gmail.com',
      alamatUser: 'Jl. Sunu',
      dateInvoice: '16-03-2022',
      dateOverdue: '27-03-2022',
      items: [
        Item(
          itemDescription: 'Bunga',
          quantity: '2',
          price: '10000',
          total: '20000',
        ),
        Item(
          itemDescription: 'Celana',
          quantity: '4',
          price: '5000',
          total: '20000',
        ),
        Item(
          itemDescription: 'Kasur',
          quantity: '1',
          price: '10000',
          total: '10000',
        ),
      ],
      totalProduct: '2',
      subtotal: '100000',
      isPaid: true,
    ),
  ];

  List<Invoice> get allInvoice => _allInvoice;
}

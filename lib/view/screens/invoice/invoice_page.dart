import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/invoice_detail_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:provider/provider.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            Text(
              'Invoice List',
              style: heading1.copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    invoiceProvider.pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: invoiceProvider.currendIndex == 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 2),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: primaryBackground, width: 3),
                            ),
                          ),
                          child: Text(
                            'Unpaid',
                            style: heading4.copyWith(color: primaryBackground),
                          ),
                        )
                      : Text(
                          'Unpaid',
                          style: heading5.copyWith(color: netralDisableColor),
                        ),
                ),
                const SizedBox(
                  width: 26.5,
                ),
                GestureDetector(
                  onTap: () {
                    invoiceProvider.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: invoiceProvider.currendIndex == 1
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 2),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: primaryBackground, width: 3),
                            ),
                          ),
                          child: Text(
                            'paid',
                            style: heading4.copyWith(color: primaryBackground),
                          ),
                        )
                      : Text(
                          'Paid',
                          style: heading5.copyWith(color: netralDisableColor),
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 5 / 8,
              child: PageView(
                controller: invoiceProvider.pageController,
                onPageChanged: (value) {
                  invoiceProvider.changePage(value);
                },
                children: [
                  ListView.builder(
                    itemCount: invoiceProvider.allInvoice.length,
                    itemBuilder: (context, index) {
                      return invoiceProvider.allInvoice[index].isPaid == false
                          ? InvoiceCard(
                              paid: invoiceProvider.allInvoice[index].isPaid,
                              date: invoiceProvider
                                  .allInvoice[index].dateInvoice
                                  .toString(),
                              nameStore: invoiceProvider
                                  .allInvoice[index].storeName
                                  .toString(),
                              price: invoiceProvider.allInvoice[index].subtotal,
                            )
                          : SizedBox();
                    },
                  ),
                  ListView.builder(
                    itemCount: invoiceProvider.allInvoice.length,
                    itemBuilder: (context, index) {
                      return invoiceProvider.allInvoice[index].isPaid == true
                          ? InvoiceCard(
                              paid: invoiceProvider.allInvoice[index].isPaid,
                              date: invoiceProvider
                                  .allInvoice[index].dateInvoice
                                  .toString(),
                              nameStore: invoiceProvider
                                  .allInvoice[index].storeName
                                  .toString(),
                              price: invoiceProvider.allInvoice[index].subtotal,
                            )
                          : SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<Widget> buildInvoiceCard(bool isPaid) {
  //   List<Widget> data = [];
  //   for (var i = 0; i < 8; i++) {
  //     data.add(InvoiceCard(paid: isPaid));
  //   }

  //   return data;
  // }
}

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    Key? key,
    required this.paid,
    this.nameStore,
    this.date,
    this.price,
  }) : super(key: key);

  final bool paid;
  final String? nameStore;
  final String? date;
  final String? price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InvoiceDetailScreen(isPaid: paid),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: netralCardColor,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff0e1f351f).withOpacity(0.12),
                  blurRadius: 3,
                  offset: const Offset(0, 3)),
            ]),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(homeSmall),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  nameStore ?? '',
                  style: heading5.copyWith(color: blackTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  date ?? '',
                  style: paragraph4.copyWith(color: netralDisableColor),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price ?? '',
                  style: subhead2.copyWith(color: blackTextColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  paid ? 'Paid' : 'Unpaid',
                  style: heading7.copyWith(
                      color: paid ? Colors.greenAccent : redColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/models/home_model/bill_model.dart';
import 'package:myinvoice/models/invoice.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/invoice_detail_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/invoice_card.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:provider/provider.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
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
                              style:
                                  heading4.copyWith(color: primaryBackground),
                            ),
                          )
                        : Text(
                            'Unpaid',
                            style: heading5.copyWith(color: netralDisableColor),
                          ),
                  ),
                  const SizedBox(
                    width: 11,
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
                              'Pending',
                              style:
                                  heading4.copyWith(color: primaryBackground),
                            ),
                          )
                        : Text(
                            'Pending',
                            style: heading5.copyWith(color: netralDisableColor),
                          ),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  GestureDetector(
                    onTap: () {
                      invoiceProvider.pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: invoiceProvider.currendIndex == 2
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
                              style:
                                  heading4.copyWith(color: primaryBackground),
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
              Expanded(
                child: PageView(
                  controller: invoiceProvider.pageController,
                  onPageChanged: (value) {
                    invoiceProvider.changePage(value);
                  },
                  children: [
                    SingleChildScrollView(
                      child: Column(
                          children: homeViewModel.dataUnpaid
                              .map((e) => InvoiceCard(
                                    recentItem: e,
                                  ))
                              .toList()),
                    ),
                    SingleChildScrollView(
                      child: Column(
                          children: homeViewModel.dataPending
                              .map((e) => InvoiceCard(
                                    recentItem: e,
                                  ))
                              .toList()),
                    ),
                    SingleChildScrollView(
                      child: Column(
                          children: homeViewModel.dataPaid
                              .map((e) => InvoiceCard(
                                    recentItem: e,
                                  ))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyInvoiceScreen extends StatelessWidget {
  const EmptyInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SvgPicture.asset('assets/icons/Receipt-pana 1.svg')],
    );
  }
}

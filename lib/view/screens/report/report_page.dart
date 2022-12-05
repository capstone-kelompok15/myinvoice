import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/invoice_page.dart';
import 'package:myinvoice/view/screens/report/chart.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:myinvoice/viewmodel/report_provider.dart';
import 'package:provider/provider.dart';

import 'components/filter_inital_page.dart';
import 'components/filter_rangetime_page.dart';
import 'components/filter_typebiils_page.dart';

class ReportPage extends StatefulWidget {
  ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = Provider.of<InvoiceProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(child:
              Consumer<ReportProvider>(builder: (context, reportProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Payment Report",
                          style: heading1.copyWith(fontSize: 30),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _filterBottomSheet(context),
                        child: SizedBox(child: SvgPicture.asset(filterIcon)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Text(
                    "${reportProvider.typeBiils} Transaction",
                    style: heading1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    height: 200,
                    child: DChartLine(
                      animate: false,
                      lineWidth: 3,
                      data: reportProvider.data,
                      areaColor: (lineData, index, id) => primaryBackground,
                      includePoints: true,
                      pointColor: (lineData, index, id) => Colors.white,
                      lineColor: (lineData, index, id) {
                        if (id == 'Paid') {
                          return Colors.green;
                        } else {
                          return Colors.redAccent;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Row(
                    children: [
                      reportProvider.typeBiils == "Paid" ||
                              reportProvider.typeBiils == "All"
                          ? Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                                Text(
                                  "Paid",
                                ),
                                SizedBox(
                                  width: 12,
                                )
                              ],
                            )
                          : SizedBox(),
                      // const SizedBox(
                      //   width: 18,
                      // ),
                      reportProvider.typeBiils == "Unpaid" ||
                              reportProvider.typeBiils == "All"
                          ? Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                                Text(
                                  "Unpaid",
                                )
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                _summaryTx(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Bills",
                            style: heading2,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text("See All",
                                style: TextStyle(
                                    color: primaryBackground, fontSize: 18)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView(
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  children: List.generate(
                      invoiceProvider.dataUnPaid.length,
                      (index) => InvoiceCard(
                          paid: true,
                          invoice: invoiceProvider.dataUnPaid[index])).toList(),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          })),
        ),
      ),
    );
  }

  Future<dynamic> _filterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 4,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Consumer<ReportProvider>(
              builder: (context, report, _) {
                if (report.reportState == ReportState.typeBiils) {
                  return filterTypesBillsPage(context, report);
                } else if (report.reportState == ReportState.rangeTime) {
                  return filterRangeTimePage(report);
                } else {
                  return filterInitialPage(context, report);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Padding _summaryTx() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Transaction",
                style: heading2,
              ),
              Text(
                "33",
                style: heading2,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Bills",
                style: heading2.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 18),
              ),
              Text(
                "IDR 4.445.000",
                style: heading2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

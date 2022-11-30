import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/invoice_page.dart';
import 'package:myinvoice/view/screens/report/chart.dart';
import 'package:myinvoice/view/styles/styles.dart';

class ChipItem {
  int? id;
  String? label;

  ChipItem({this.id, this.label});
}

class ReportPage extends StatefulWidget {
  ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<ChipItem> _listChip = [
    ChipItem(id: 0, label: "Number of Transaction"),
    ChipItem(id: 1, label: "Total Amount"),
    ChipItem(id: 2, label: "Highest Transaction"),
  ];

  int _idSelected = 1;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Payment Report",
                  style: heading1.copyWith(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  children: _listChip
                      .map((value) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                                elevation: 0,
                                pressElevation: 0,
                                selectedColor: Theme.of(context).primaryColor,
                                labelStyle: TextStyle(
                                    color: value.id == _idSelected
                                        ? Colors.white
                                        : primaryBackground),
                                onSelected: (_) => setState(() {
                                      _idSelected = value.id ?? 0;
                                    }),
                                label: Text(value.label ?? ""),
                                selected: value.id == _idSelected),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Transaction",
                      style: heading2,
                    ),
                    Text(
                      "33",
                      style: heading1,
                    )
                  ],
                ),
              ),
              const ChartView(),
              SizedBox(
                height: 12,
              ),
              DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              child: TabBar(
                                  isScrollable: true,
                                  labelColor: Colors.black87,
                                  labelStyle: heading4,
                                  indicatorColor: primaryBackground,
                                  indicatorWeight: 3,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  tabs: const [
                                    Tab(
                                      text: "1 Weeks",
                                    ),
                                    Tab(
                                      text: "1 Month",
                                    ),
                                    Tab(
                                      text: "1 Year",
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              "All",
                              style: heading4,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(children: [
                          ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            children: List.generate(
                                    10, (index) => InvoiceCard(paid: true))
                                .toList(),
                          ),
                          ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            children: List.generate(
                                    10, (index) => InvoiceCard(paid: true))
                                .toList(),
                          ),
                          ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            children: List.generate(
                                    10, (index) => InvoiceCard(paid: true))
                                .toList(),
                          ),
                        ]),
                      )
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}

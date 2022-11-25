import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/home_summary.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textButtonColor = Color(0xff131089);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 195,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Invoice",
                          style: title.copyWith(color: Colors.white),
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Summary",
                        style: sectionTitle,
                      ),
                      TextButton(
                        child: Text(
                          'Details',
                          style: TextStyle(
                              color: textButtonColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Flexible(
                        flex: 1,
                        child: HomeSummary(
                          amount: 'IDR 200',
                          status: 'Total Paid',
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: HomeSummary(
                          amount: 'IDR 200',
                          status: 'Unpaid',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bills",
                        style: sectionTitle,
                      ),
                      TextButton(
                        child: Text(
                          'See All',
                          style: TextStyle(
                              color: textButtonColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Flexible(
                        flex: 1,
                        child: HomeSummary(
                          amount: 'IDR 200',
                          status: 'Total Paid',
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: HomeSummary(
                          amount: 'IDR 200',
                          status: 'Unpaid',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/notification/notification_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/home_summary.dart';
import 'package:myinvoice/view/widgets/recent_bills.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final textButtonColor = Color(0xff131089);
    return Scaffold(
      body: ListView(
        shrinkWrap: false,
        children: [
          Column(
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
                  padding: const EdgeInsets.symmetric(horizontal: 23),
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
                          Badge(
                            toAnimate: true,
                            animationType: BadgeAnimationType.scale,
                            badgeContent: Text(
                              textScaleFactor: 0.5,
                              '55',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            badgeColor: redColor,
                            position: BadgePosition.topEnd(top: 2, end: 8),
                            child: IconButton(
                              icon:
                                  SvgPicture.asset(iconNotifFilled, width: 24),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const NotificationScreen();
                                    },
                                  ),
                                );
                              },
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome!',
                        style: body3.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      Text(
                        'Clarissa Maharani',
                        style: body1.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
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
                          onPressed: () => homeViewModel.ontap(2),
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
                          "Recent Bills",
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
                          onPressed: () => homeViewModel.ontap(1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const RecentBills(),
        ],
      ),
    );
  }
}

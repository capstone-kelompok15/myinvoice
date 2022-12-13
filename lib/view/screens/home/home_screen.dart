import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/home/home/home_page.dart';
import 'package:myinvoice/view/screens/invoice/invoice_page.dart';
import 'package:myinvoice/view/screens/report/report_page.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/invoice_provider.dart';
import '../profile_page/profile_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: false,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: SizedBox(
            height: 84,
            child: BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                unselectedFontSize: 12,
                selectedFontSize: 12,
                elevation: 0,
                currentIndex: homeViewModel.currentIndex,
                onTap: (value) {
                  homeViewModel.ontap(value);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                        homeViewModel.currentIndex == 0
                            ? iconHomeFilled
                            : iconHome,
                        height: 26),
                    // activeIcon: SvgPicture.asset(iconHomeFilled, width: 26),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(iconInvoice, width: 26),
                      activeIcon:
                          SvgPicture.asset(iconInvoiceFilled, width: 26),
                      label: "Invoice"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(iconReport, width: 26),
                      activeIcon: SvgPicture.asset(iconReportFilled, width: 26),
                      label: "Report"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(iconProfile, width: 26),
                      activeIcon:
                          SvgPicture.asset(iconProfileFilled, width: 26),
                      label: "Profile"),
                ]),
          ),
        ),
        body: IndexedStack(
          index: homeViewModel.currentIndex,
          children: [
            HomePage(),
            InvoicePage(),
            ReportPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}

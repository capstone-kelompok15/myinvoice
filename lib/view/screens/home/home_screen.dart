import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/home/home/home_page.dart';
import 'package:myinvoice/view/screens/profile/profile_page.dart';
import 'package:myinvoice/view/screens/invoice/invoice_page.dart';
import 'package:myinvoice/view/screens/report/report_page.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  void _changeTab(int value) {
    setState(() {
      _index = value;
    });
  }

  // final List<Widget> _pages = [
  //   HomePage(),
  //   InvoicePage(),
  //   // Center(
  //   //   child: Text("Report"),
  //   // ),
  //   ReportPage(),
  //   ProfilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
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
                currentIndex: _index,
                onTap: _changeTab,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                        _index == 0 ? iconHomeFilled : iconHome,
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
          index: _index,
          children: modelView.pages,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/home/home/home_page.dart';
import 'package:myinvoice/view/screens/home/home/profile_page.dart';
import 'package:myinvoice/view/styles/styles.dart';

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

  List<Widget> _pages = const [
    HomePage(),
    Center(
      child: Text("Invoice"),
    ),
    Center(
      child: Text("Report"),
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
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
              iconSize: 26,
              elevation: 0,
              currentIndex: _index,
              onTap: _changeTab,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    iconHome,
                    color: Colors.white,
                    width: 26,
                    height: 26,
                  ),
                  activeIcon: SvgPicture.asset(
                    iconHomeFilled,
                    color: Colors.white,
                    width: 26,
                    height: 26,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    iconInvoice,
                    color: Colors.white,
                    width: 26,
                    height: 26,
                  ),
                  activeIcon: SvgPicture.asset(iconInvoiceFilled),
                  label: "Invoice",
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(iconReport),
                    activeIcon: SvgPicture.asset(iconReportFilled),
                    label: "Report"),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(iconProfile),
                  activeIcon: SvgPicture.asset(iconProfileFilled),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _index,
          children: _pages,
        ),
      ),
    );
  }
}

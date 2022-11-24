import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myinvoice/view/screens/home/home/home_page.dart';
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
    Center(
      child: Text("Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: SizedBox(
            height: 120,
            child: BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedLabelStyle: body1.copyWith(fontSize: 14),
                elevation: 0,
                currentIndex: _index,
                onTap: _changeTab,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.inventory_outlined), label: "Invoice"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt), label: "Report"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile"),
                ]),
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

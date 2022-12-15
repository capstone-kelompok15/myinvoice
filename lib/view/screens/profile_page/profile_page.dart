import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/data/pref.dart';
import 'package:myinvoice/models/customer.dart';
import 'package:myinvoice/services/customer_services.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/auth/signin_screen.dart';
import 'package:myinvoice/view/screens/profile_page/help_center_screen.dart';
import 'package:myinvoice/view/screens/profile_page/personal_data_screen.dart';
import 'package:myinvoice/view/screens/profile_page/privacy_policy_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileHomeView = Provider.of<ProfileProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              color: primaryBackground,
            ),
            FutureBuilder<Customer>(
                future: CustomerServices().getCustomer(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 12, bottom: 24),
                      decoration: BoxDecoration(
                          color: primaryBackground,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            backgroundImage: NetworkImage(
                                snapshot.data!.displayProfilePictureUrl!),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            snapshot.data!.fullName!,
                            style: heading2.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            snapshot.data!.email ?? '',
                            style: paragraph4.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    // profileHomeView.customer.displayProfilePictureUrl!,
                    style: heading4.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildCardSetting(
                      'assets/icons/fi-rr-user (1).svg',
                      'Personal Data',
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PersonalDataScreen(),
                          ))),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'More',
                    style: heading4.copyWith(color: blackTextColor),
                  ),
                  _buildCardSetting(
                      lock,
                      'Privacy Policy',
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ))),
                  _buildCardSetting(
                    help,
                    'Help Center',
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpCenterScreen(),
                        )),
                  ),
                  _buildCardSetting(
                      'assets/icons/fi-rr-info.svg', 'About', () {},
                      isArrow: false, isTwoText: true, text2: 'Versi 1.1'),
                  _buildCardSetting(
                    'assets/icons/logout.svg',
                    'Logout',
                    isArrow: false,
                    isRed: true,
                    () => _dialogBuilder(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Logging Out')),
          content: Text(
            'Are you sure want to sign out from your myinvoice account?',
            style: paragraph4.copyWith(color: blackTextColor),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Pref.removeToken();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardSetting(String icon, String title, Function() press,
      {bool isArrow = true,
      bool isTwoText = false,
      String text2 = '',
      bool isRed = false}) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: (8),
            ),
            isTwoText
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: paragraph4.copyWith(color: blackTextColor),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: netralDisableColor),
                      )
                    ],
                  )
                : Text(
                    title,
                    style: paragraph4.copyWith(
                        color: isRed ? Colors.red : blackTextColor),
                  ),
            const Spacer(),
            isArrow
                ? SvgPicture.asset('assets/icons/arrow.svg')
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

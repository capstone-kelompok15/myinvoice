import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/profile_page/help_center.dart';
import 'package:myinvoice/view/screens/profile_page/personal_data_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            color: primaryBackground,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 24),
            decoration: BoxDecoration(color: primaryBackground),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Clarissa Maharani',
                  style: heading5.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'ClarissaMaharani@gmail.com',
                  style: paragraph4.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Details',
                  style: heading4.copyWith(color: blachTextColor),
                ),
                _buildCardSetting(
                    user,
                    'Perssonal Data',
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalDataScreen(),
                        ))),
                Text(
                  'More',
                  style: heading4.copyWith(color: blachTextColor),
                ),
                _buildCardSetting(
                  lock,
                  'Privacy Policy',
                  () => null,
                ),
                _buildCardSetting(
                  help,
                  'Help Center',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpCenterScreen(),
                      )),
                ),
                _buildCardSetting(info, 'About', () {},
                    isArrow: false, isTwoText: true, text2: 'Versi 1.1'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardSetting(String icon, String title, Function() press,
      {bool isArrow = true, bool isTwoText = false, String text2 = ''}) {
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
            SizedBox(
              width: (8),
            ),
            isTwoText
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: paragraph4.copyWith(color: blachTextColor),
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
                    style: paragraph4.copyWith(color: blachTextColor),
                  ),
            Spacer(),
            isArrow
                ? SvgPicture.asset('assets/icons/arrow.svg')
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
//   width: double.infinity,
//   child: ElevatedButton(
//     style: TextButton.styleFrom(
//       elevation: 0,
//       side: BorderSide(width: 2, color: redColor),
//       backgroundColor: whiteTextColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           (10),
//         ),
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: (13),
//       ),
//     ),
//     onPressed: () {},
//     child: Text(
//       'Logout',
//       style: heading4.copyWith(color: redColor),
//     ),
//   ),
// ),

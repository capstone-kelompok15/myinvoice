import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
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
            height: (150),
            decoration: BoxDecoration(
              color: primaryBackground,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  (50),
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: (66),
                    bottom: (24),
                    left: (30),
                  ),
                  child: CircleAvatar(
                    backgroundColor: backgroundProfileColor,
                    radius: (30),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: (69),
                        left: (12),
                        right: (86),
                      ),
                      child: Text(
                        'Clarissa Maharani',
                        style: heading3.copyWith(
                          color: whiteTextColor,
                          fontSize: (18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (6),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: (12),
                        right: (31),
                      ),
                      child: Text(
                        'Clarissa Maharani@gmail.com',
                        style: heading5.copyWith(color: whiteTextColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: (20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (30),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 4.65,
              padding: EdgeInsets.only(
                left: (15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: heading4.copyWith(
                      color: blachTextColor,
                      fontSize: (16),
                    ),
                  ),
                  SizedBox(
                    height: (10),
                  ),
                  _buildCardSetting(edit, 'Edit Profile'),
                  _buildCardSetting(lock, 'Password'),
                  SizedBox(
                    height: (10),
                  ),
                  Text(
                    'More',
                    style: heading4.copyWith(color: blachTextColor),
                  ),
                  SizedBox(
                    height: (15),
                  ),
                  _buildCardSetting(bell, 'Notification', isToggle: true),
                  _buildCardSetting(creditCard, 'Payment'),
                  _buildCardSetting(language, 'Language'),
                  _buildCardSetting(lock, 'Privacy Policy'),
                  _buildCardSetting(help, 'Help & Support'),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                elevation: 0,
                side: BorderSide(width: 2, color: redColor),
                backgroundColor: whiteTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    (10),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: (12),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Logout',
                style: heading4.copyWith(color: redColor),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 1 / 4.4,
          )
        ],
      ),
    );
  }

  Widget _buildCardSetting(String icon, String title, {bool isToggle = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 10, right: 20),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            width: (5),
          ),
          Text(
            title,
            style: paragraph4.copyWith(color: blachTextColor),
          ),
          Spacer(),
          isToggle
              ? SvgPicture.asset('assets/icons/Toggle.svg')
              : SvgPicture.asset('assets/icons/arrow.svg'),
        ],
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
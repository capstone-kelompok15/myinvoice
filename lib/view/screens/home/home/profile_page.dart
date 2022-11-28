import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: (150),
            decoration: BoxDecoration(
              color: primaryBackground,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(
                  (50),
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
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
                      padding: const EdgeInsets.only(
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
                    const SizedBox(
                      height: (6),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
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
          const SizedBox(
            height: (20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: (30),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: (15),
                top: (12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: heading4.copyWith(
                      color: blackTextColor,
                      fontSize: (16),
                    ),
                  ),
                  const SizedBox(
                    height: (10),
                  ),
                  Column(
                    children: profileProvider.dataAccount
                        .map((e) => _buildCardSetting(e))
                        .toList(),
                  ),
                  Text(
                    'More',
                    style: heading4.copyWith(color: blackTextColor),
                  ),
                  const SizedBox(
                    height: (10),
                  ),
                  Column(
                    children: profileProvider.dataMore
                        .map((e) => _buildCardSetting(e))
                        .toList(),
                  ),
                  const SizedBox(
                    height: (24),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: (30),
            ),
            child: SizedBox(
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
                  padding: const EdgeInsets.symmetric(
                    vertical: (13),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Logout',
                  style: heading4.copyWith(color: redColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSetting(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(
        left: (5),
        bottom: (15),
      ),
      child: Row(
        children: [
          SvgPicture.asset(data['icon']),
          const SizedBox(
            width: (5),
          ),
          Text(
            data['title'],
            style: paragraph4.copyWith(color: blackTextColor),
          ),
          const Spacer(),
          data['isToogle'] ? SvgPicture.asset(toggle) : SvgPicture.asset(arrow),
          const SizedBox(
            width: (21),
          ),
        ],
      ),
    );
  }
}

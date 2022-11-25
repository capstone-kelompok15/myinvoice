import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/config/config.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getPropertionateScreenHeight(150),
            decoration: BoxDecoration(
              color: primaryBackground,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  getPropertionateScreenWidht(50),
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getPropertionateScreenHeight(66),
                    bottom: getPropertionateScreenHeight(24),
                    left: getPropertionateScreenWidht(30),
                  ),
                  child: CircleAvatar(
                    backgroundColor: backgroundProfileColor,
                    radius: getPropertionateScreenWidht(30),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getPropertionateScreenHeight(69),
                        left: getPropertionateScreenWidht(12),
                        right: getPropertionateScreenWidht(86),
                      ),
                      child: Text(
                        'Clarissa Maharani',
                        style: heading3.copyWith(
                          color: whiteTextColor,
                          fontSize: getPropertionateScreenWidht(18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getPropertionateScreenHeight(6),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getPropertionateScreenWidht(12),
                        right: getPropertionateScreenWidht(31),
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
            height: getPropertionateScreenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPropertionateScreenWidht(30),
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: getPropertionateScreenWidht(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: heading4.copyWith(
                      color: blachTextColor,
                      fontSize: getPropertionateScreenWidht(16),
                    ),
                  ),
                  SizedBox(
                    height: getPropertionateScreenHeight(10),
                  ),
                  Column(
                    children: profileProvider.dataAccount
                        .map((e) => _buildCardSetting(e))
                        .toList(),
                  ),
                  Text(
                    'More',
                    style: heading4.copyWith(color: blachTextColor),
                  ),
                  SizedBox(
                    height: getPropertionateScreenHeight(10),
                  ),
                  Column(
                    children: profileProvider.dataMore
                        .map((e) => _buildCardSetting(e))
                        .toList(),
                  ),
                  SizedBox(
                    height: getPropertionateScreenHeight(24),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                        side: BorderSide(width: 2, color: redColor),
                        backgroundColor: whiteTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            getPropertionateScreenWidht(10),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: getPropertionateScreenHeight(13),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Logout',
                        style: heading4.copyWith(color: redColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSetting(Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsets.only(
        left: getPropertionateScreenWidht(5),
        bottom: getPropertionateScreenWidht(15),
      ),
      child: Row(
        children: [
          SvgPicture.asset(data['icon']),
          SizedBox(
            width: getPropertionateScreenWidht(5),
          ),
          Text(
            data['title'],
            style: paragraph4.copyWith(color: blachTextColor),
          ),
          Spacer(),
          data['isToogle']
              ? SvgPicture.asset('assets/icons/Toggle.svg')
              : SvgPicture.asset('assets/icons/arrow.svg'),
        ],
      ),
    );
  }
}

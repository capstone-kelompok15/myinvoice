import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/styles.dart';

class ChooseBankCard extends StatelessWidget {
  const ChooseBankCard({
    Key? key,
    required this.namaBank,
    required this.icon,
  }) : super(key: key);

  final String namaBank;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                width: 15,
              ),
              Text(
                namaBank,
                style: paragraph4.copyWith(color: Colors.black),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myinvoice/view/styles/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? icon;
  final TextEditingController? controller;
  final bool isPassword;
  final Function()? press;
  final bool isRead;

  const CustomTextField({
    Key? key,
    this.title,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.isRead = false,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Title",
            style: body3,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
              onTap: press,
              obscureText: isPassword,
              readOnly: isRead,
              controller: controller,
              decoration: icon != null
                  ? InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        icon!,
                        height: 20,
                        width: 20,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: hint,
                      hintStyle: paragraph4.copyWith(color: netralDisableColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)))
                  : InputDecoration(
                      hintText: hint,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)))),
        ],
      ),
    );
  }
}

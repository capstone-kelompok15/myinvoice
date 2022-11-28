import 'package:flutter/material.dart';
import 'package:myinvoice/view/styles/styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: primaryMain,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: press,
        child: Text(
          title,
          style: heading4,
        ),
      ),
    );
  }
}

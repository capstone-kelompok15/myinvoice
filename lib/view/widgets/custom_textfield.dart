import 'package:flutter/material.dart';
import 'package:myinvoice/view/styles/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.title,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? "Title",
            style: body3,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            validator: widget.validator,
            obscureText: showPassword && widget.isPassword,
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(showPassword
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      )
                    : null,
                hintText: widget.hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ],
      ),
    );
  }
}

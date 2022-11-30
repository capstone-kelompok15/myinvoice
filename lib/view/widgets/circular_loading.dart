import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CicularLoading extends StatelessWidget {
  const CicularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

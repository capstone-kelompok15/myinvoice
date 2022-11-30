import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Data'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 35,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Full Name',
                hint: 'Clarissa Maharani',
              ),
              CustomTextField(
                title: 'Email',
                hint: 'ClarissaMaharani@gmail.com',
              ),
              CustomTextField(
                title: 'Number Phone',
                hint: '0849723434',
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

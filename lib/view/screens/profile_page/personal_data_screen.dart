import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myinvoice/services/customer_services.dart';
import 'package:myinvoice/services/invoice_service.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:provider/provider.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File file = File('');
    Future<XFile?> getImage() async {
      ImagePicker _picker = ImagePicker();
      XFile? selectImage = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 30);
      file = File(selectImage!.path);
      print(file);
      return XFile(selectImage.path);
    }

    final profileHomeView = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: MethodHelper.buildAppBar(context, 'Personal Data'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    profileHomeView.customer.displayProfilePictureUrl!),
              ),
              SizedBox(
                height: 6,
              ),
              TextButton(
                onPressed: () async {
                  await getImage();
                  await CustomerServices().uploadImage(file);
                  await profileHomeView.getCustomer();
                },
                child: Text(
                  'Edit Photo',
                  style: heading5.copyWith(color: primaryMain),
                ),
                //  child 'Edit Photo',
                //   style: heading5.copyWith(color: primaryMain),
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
              Container(
                height: 110,
                child: CustomTextField(
                  title: 'Adress',
                  hint: 'Jl mangga no 20',
                ),
              ),
              SizedBox(
                height: 60,
              ),
              RoundedButton(
                  title: 'Save',
                  press: () {
                    // InvoiceServices().getInvoice();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

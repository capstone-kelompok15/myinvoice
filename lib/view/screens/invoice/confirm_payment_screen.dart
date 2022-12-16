import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myinvoice/services/invoice_service.dart';
import 'package:myinvoice/view/screens/invoice/status_pembayaran_screen.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../styles/styles.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/method_helper.dart';
import '../../widgets/rounded_button.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

String nameImage = 'Invioce.jpg';

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    File file = File('');
    Future<XFile?> getImage() async {
      ImagePicker picker = ImagePicker();
      XFile? selectImage =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
      file = File(selectImage!.path);

      setState(() {
        nameImage = selectImage.name;
      });
      print(file);
      return XFile(selectImage.path);
    }

    final invoiceDetail = Provider.of<InvoiceProvider>(context).invoiceDetail;
    TextEditingController dateC =
        TextEditingController(text: formatDateBasic(DateTime.now()));
    TextEditingController invoicedC =
        TextEditingController(text: 'INV - ${invoiceDetail.invoiceId}');
    TextEditingController nameC =
        TextEditingController(text: invoiceDetail.customerName);
    TextEditingController totalC =
        TextEditingController(text: 'IDR. ${invoiceDetail.totalPrice}');
    TextEditingController imageC = TextEditingController(text: nameImage);
    return Scaffold(
      appBar: MethodHelper.buildAppBar(context, 'Confirm Payment'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                isRead: true,
                title: 'Date Invoice',
                icon: calender,
                controller: dateC,
              ),
              CustomTextField(
                isRead: true,
                controller: invoicedC,
                title: 'Nomor Invoice',
                icon: invoice1,
              ),
              CustomTextField(
                title: 'Name Customer',
                icon: potrait,
                isRead: true,
                controller: nameC,
              ),
              CustomTextField(
                title: 'Total Payment',
                icon: money,
                controller: totalC,
                isRead: true,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Upload Evidance of Transfer',
                style: heading5.copyWith(color: blackTextColor),
              ),
              SizedBox(
                height: 55,
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: primaryBorder,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        clip,
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextFormField(
                        // controller: imageC,
                        readOnly: true,
                        onTap: () async {
                          await getImage();
                          await InvoiceServices()
                              .uploadImage(file, invoiceDetail.invoiceId!);
                        },
                        decoration: InputDecoration(
                          hintText: nameImage,
                          suffix: SvgPicture.asset(cross),
                          fillColor: const Color(0xffcdcdcd),
                          filled: true,
                          hintStyle:
                              paragraph4.copyWith(color: netralDisableColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              RoundedButton(
                title: 'Confirm',
                press: () async {

                  await InvoiceServices()
                      .confirmPaymentByid(invoiceDetail.invoiceId!);


                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatusPembayaranScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

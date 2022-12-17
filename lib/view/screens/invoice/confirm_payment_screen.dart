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

import '../../../models/invoice_detail_model.dart';
import '../../constant/constant.dart';
import '../../styles/styles.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/method_helper.dart';
import '../../widgets/rounded_button.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({
    super.key,
  });

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

File file = File('');

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InvoiceProvider invoiceProvider =
        Provider.of<InvoiceProvider>(context);
    InvoiceDetail invoiceDetail = invoiceProvider.invoiceDetail;

    Future getImage() async {
      ImagePicker picker = ImagePicker();
      XFile? selectImage =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

      setState(() {
        file = File(selectImage!.path);
        invoiceProvider.nameImage = selectImage.name;
      });
      print(file);
    }

    TextEditingController dateC =
        TextEditingController(text: formatDateBasic(DateTime.now()));
    TextEditingController invoicedC =
        TextEditingController(text: 'INV - ${invoiceDetail.invoiceId}');
    TextEditingController nameC =
        TextEditingController(text: invoiceDetail.customerName);
    TextEditingController totalC =
        TextEditingController(text: 'IDR. ${invoiceDetail.totalPrice}');
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: MethodHelper.buildAppBar(context, 'Confirm Payment'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
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
                          readOnly: true,
                          onTap: () async {
                            await getImage();
                          },
                          decoration: InputDecoration(
                            hintText: invoiceProvider.nameImage,
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
                  isLoading: invoiceProvider.isloading,
                  press: () async {
                    invoiceProvider.onPress();
                    await InvoiceServices()
                        .confirmPaymentByid(invoiceDetail.invoiceId!, file);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StatusPembayaranScreen(),
                      ),
                    );
                    invoiceProvider.onPress();
                    await invoiceProvider.resetnameImage();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/status_pembayaran_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/view/widgets/custom_textfield.dart';
import 'package:myinvoice/view/widgets/method_helper.dart';
import 'package:myinvoice/view/widgets/rounded_button.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:provider/provider.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

String nameImage = 'Invoice.jpg';

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController imageInput = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<XFile?> getImage() async {
      ImagePicker picker = ImagePicker();
      XFile? selectImage = await picker.pickImage(
          source: ImageSource.gallery, imageQuality: 30);

      setState(() {
        nameImage = selectImage!.name;
      });
      return XFile(selectImage!.path);
    }

    final invoiceProvider = Provider.of<InvoiceProvider>(context);
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
                controller: dateinput,
                press: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        // DateFormat('yyyy-MM-dd').format(pickedDate);
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                isRead: true,
                title: 'Date Invoice',
                icon: calender,
                hint: '22-11-2022',
              ),
              const CustomTextField(
                title: 'Nomor Invoice',
                icon: invoice1,
                hint: 'INV-00341212',
              ),
              const CustomTextField(
                title: 'Name Customer',
                icon: potrait,
                hint: 'e.g. Novita Lia',
              ),
              const CustomTextField(
                title: 'Total Payment',
                icon: money,
                hint: 'Rp. 2.200.000',
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
                        // controller: imageInput,
                        // onChanged: (value) async {
                        //   final file = await getImage();
                        //   value = file!.name;
                        // },
                        readOnly: true,
                        onTap: () async {
                          await getImage();
                          print('sukses');
                        },
                        decoration: InputDecoration(
                          suffix: SvgPicture.asset(cross),
                          fillColor: const Color(0xffcdcdcd),
                          filled: true,
                          hintText: nameImage,
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
                press: () {
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

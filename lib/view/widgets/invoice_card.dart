// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class InvoiceCard extends StatelessWidget {
  final String? merchantName;
  final String? dueDate;
  final String? bill;
  final String? status;

  const InvoiceCard({
    Key? key,
    this.merchantName,
    this.dueDate,
    this.bill,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
      itemCount: modelView.recentList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.5),
            child: ListTile(
              tileColor: netralCardColor,
              leading: SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    modelView.recentList[index].avatar!,
                    color: Color(0xff404040),
                    width: 20,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    modelView.recentList[index].merchantName!,
                    style: sectionHead.copyWith(color: primaryText),
                  ),
                  Text(
                    idrFormat.format(modelView.recentList[index].bill),
                    style: sectionHead.copyWith(
                        color: primaryText, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    modelView.recentList[index].date!,
                    style: sectionSubHead.copyWith(
                      color: Color(0xff999999),
                    ),
                  ),
                  if (modelView.recentList[index].status == 'Paid') ...[
                    Text(
                      modelView.recentList[index].status!,
                      style: body4.copyWith(
                        color: greenColor,
                      ),
                    ),
                  ] else if (modelView.recentList[index].status ==
                      'Unpaid') ...[
                    Text(
                      modelView.recentList[index].status!,
                      style: body4.copyWith(
                        color: redColor,
                      ),
                    ),
                  ] else if (modelView.recentList[index].status ==
                      'Pending') ...[
                    Text(
                      modelView.recentList[index].status!,
                      style: body4.copyWith(
                        color: orangeColor,
                      ),
                    ),
                  ],
                ],
              ),
              onTap: () {},
            ),
          ),
        );
      },
      //       children: [
      //
      //         SizedBox(height: 10),
      // ],
    );
  }
}

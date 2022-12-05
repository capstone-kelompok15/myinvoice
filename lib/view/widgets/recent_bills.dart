// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class RecentBills extends StatelessWidget {
  final String? merchantName;
  final String? dueDate;
  final String? bill;
  final bool isPaid;

  const RecentBills({
    Key? key,
    this.merchantName,
    this.dueDate,
    this.bill,
    this.isPaid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    return ListView.separated(
      shrinkWrap: true,
<<<<<<< HEAD
      primary: false,
=======
      physics: const NeverScrollableScrollPhysics(),
>>>>>>> brian/report
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
      itemCount: modelView.recentList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            decoration: BoxDecoration(
              color: netralCardColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(14, 31, 53, 0.12),
                  offset: Offset.fromDirection(1.5, 4),
                  blurRadius: 7,
                ),
              ],
            ),
            child: ListTile(
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
                  Text(
                    modelView.recentList[index].isPaid ? "Paid" : "Unpaid",
                    style: sectionSubHead.copyWith(
                      fontWeight: FontWeight.bold,
                      color: modelView.recentList[index].isPaid
                          ? greenColor
                          : redColor,
                    ),
                  ),
                ],
              ),
<<<<<<< HEAD
              onTap: () {
                
              },
=======
              onTap: () {},
>>>>>>> brian/report
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

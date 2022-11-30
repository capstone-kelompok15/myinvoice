import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: blackTextColor,
                ),
              ),
              Text(
                "Back",
                style: TextStyle(color: blackTextColor),
              ),
            ],
          ),
        ),
        // leading: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //       iconSize: 14,
        //       color: primaryMain,
        //       icon: const Icon(Icons.arrow_back_ios),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //     Text(
        //       'Back',
        //       style: paragraph4.copyWith(color: primaryMain),
        //     ),
        //   ],
        // ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Notification",
          style: heading3.copyWith(color: primaryBackground),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                isThreeLine: true,
                leading: Container(
                  transform: Matrix4.translationValues(0, -20, 0),
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: SvgPicture.asset(
                    iconInvoiceFilled,
                    width: 24,
                    color: primaryBackground,
                  ),
                ),
                title: Container(
                  transform: Matrix4.translationValues(0, -10, 0),
                  padding: EdgeInsets.fromLTRB(0, 10, 42, 0),
                  child: Text(
                    "Payment Success",
                    style: heading3.copyWith(
                        color: primaryBackground, letterSpacing: 0.16),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 42, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: notifContent.copyWith(color: primaryBackground),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${DateFormat('d MMM y, HH:mm').format(DateTime.now())}",
                        style: notifContent,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                color: Colors.black.withOpacity(.1),
              );
            },
            itemCount: 10),
      ),
    );
  }
}


// if (isInfo) {
//                   Icon(
//                     Icons.info,
//                     color: primaryMain,
//                   );
//                 } else if (isPayment) {
//                   Icon(
//                     Icons.payment,
//                     color: primaryMain,
//                   );
//                 } else if (isInvoice) {
//                   Icon(
//                     Icons.receipt,
//                     color: primaryMain,
//                   );
//                 },
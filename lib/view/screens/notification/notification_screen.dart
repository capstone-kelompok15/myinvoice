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
  notifIcon() {}

  @override
  Widget build(BuildContext context) {
    final bool isInfo = true;
    final bool isPayment = true;
    final bool isInvoice = true;

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
                leading: SvgPicture.asset(iconChatFilled),
                title: Text(
                  "Payment Success",
                  style: heading3.copyWith(
                      color: primaryBackground, letterSpacing: 0.16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text("Subtitle"),
                    ),
                    Text(
                        "${DateFormat('d MMM y, HH:m').format(DateTime.now())}"),
                  ],
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
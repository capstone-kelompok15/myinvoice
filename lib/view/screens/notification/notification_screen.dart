import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/notification_view_model.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<NotificationViewModel>(context);
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
      body: modelView.notifItems.isNotEmpty
          ? SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      isThreeLine: true,
                      leading: Container(
                        transform: Matrix4.translationValues(0, -20, 0),
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: SvgPicture.asset(
                          modelView.notifItems[index].avatar!,
                          width: 24,
                          color: primaryBackground,
                        ),
                      ),
                      title: Container(
                        transform: Matrix4.translationValues(0, -10, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 42, 0),
                        child: Text(
                          modelView.notifItems[index].title!,
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
                              modelView.notifItems[index].content!,
                              style: notifContent.copyWith(
                                  color: primaryBackground),
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
                  itemCount: modelView.notifItems.length),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/empty_notification.svg",
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text(
                    "No Notification",
                    style: title.copyWith(color: primaryText),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "when you get notification, they'll show up here",
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
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
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/services/invoice_service.dart';
import 'package:myinvoice/view/constant/constant.dart';
import 'package:myinvoice/view/screens/invoice/invoice_detail_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:myinvoice/viewmodel/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Provider.of<NotificationProvider>(context, listen: false)
        .getAllNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifViewModel = Provider.of<NotificationProvider>(context);
    final dataViewModel =
        Provider.of<NotificationProvider>(context).notification?.data;
    final invoiceViewModel = Provider.of<InvoiceProvider>(context);
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
      body: dataViewModel != null
          ? SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    notifIcons() {
                      if (dataViewModel[index].notificationType == 'info') {
                        return SvgPicture.asset(
                          'assets/icons/info.svg',
                          color: primaryBackground,
                          width: 24,
                        );
                      } else if (dataViewModel[index].notificationType ==
                          'payment') {
                        return SvgPicture.asset(
                          'assets/icons/payment.svg',
                          color: primaryBackground,
                          width: 24,
                        );
                      } else if (dataViewModel[index].notificationType ==
                          'invoice') {
                        return SvgPicture.asset(
                          'assets/icons/invoice.svg',
                          color: primaryBackground,
                          width: 24,
                        );
                      }
                    }

                    if (dataViewModel[index].isRead == true) {
                      return ListTile(
                        onTap: () {},
                        isThreeLine: true,
                        leading: Container(
                          transform: Matrix4.translationValues(0, -10, 0),
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: notifIcons(),
                          // SvgPicture.asset(
                          //   dataViewModel[index].avatar!,
                          //   width: 24,
                          //   color: primaryBackground,
                          // ),
                        ),
                        title: Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 42, 0),
                          child: Text(
                            dataViewModel[index].title!,
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
                                dataViewModel[index].content!,
                                style: notifContent.copyWith(
                                    color: primaryBackground),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                formatDateNotif(
                                  DateTime.parse(
                                      dataViewModel[index].createdAt!),
                                ),
                                style: notifContent,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListTile(
                        onTap: () {
                          notifViewModel
                              .markAsRead(dataViewModel[index].id!.toString());
                          setState(() {
                            dataViewModel[index].isRead = true;
                          });
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => InvoiceDetailScreen(
                                  dataViewModel[index].invoiceId!,
                                  isPaid: true),
                            ),
                          );
                        },
                        isThreeLine: true,
                        tileColor: netralCardColor,
                        leading: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Badge(
                              badgeColor: Colors.orange,
                              position: BadgePosition.topEnd(top: -1, end: -1),
                              child: notifIcons()),
                        ),
                        title: Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 42, 0),
                          child: Text(
                            dataViewModel[index].title!,
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
                                dataViewModel[index].content!,
                                style: notifContent.copyWith(
                                    color: primaryBackground),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                formatDateNotif(
                                  DateTime.parse(
                                      dataViewModel[index].createdAt!),
                                ),
                                // dataViewModel[index].createdAt!,
                                style: notifContent,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: .5,
                      height: 1,
                      color: Colors.black.withOpacity(0.3),
                    );
                  },
                  itemCount: dataViewModel.length),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/empty_notification.svg",
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    "No Notification",
                    style: title.copyWith(color: primaryText),
                  ),
                  const SizedBox(
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

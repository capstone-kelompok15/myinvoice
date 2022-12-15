import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<NotificationProvider>(context);
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
                    notifIcons() {
                      if (modelView.notifItems[index].type == 'info') {
                        return SvgPicture.asset(
                          'assets/icons/info.svg',
                          color: primaryBackground,
                          width: 24,
                        );
                      } else if (modelView.notifItems[index].type ==
                          'payment') {
                        return SvgPicture.asset(
                          'assets/icons/payment.svg',
                          color: primaryBackground,
                          width: 24,
                        );
                      } else if (modelView.notifItems[index].type ==
                          'invoice') {
                        return SvgPicture.asset(
                          'assets/icons/invoice.svg',
                          color: primaryBackground,
                          width: 24,
                        );
                      }
                    }

                    if (modelView.notifItems[index].isRead == true) {
                      return ListTile(
                        onTap: () {},
                        isThreeLine: true,
                        leading: Container(
                          transform: Matrix4.translationValues(0, -10, 0),
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: notifIcons(),
                          // SvgPicture.asset(
                          //   modelView.notifItems[index].avatar!,
                          //   width: 24,
                          //   color: primaryBackground,
                          // ),
                        ),
                        title: Container(
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
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                DateFormat('d MMM y, HH:mm')
                                    .format(DateTime.now()),
                                style: notifContent,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListTile(
                        onTap: () {
                          modelView.markAsRead(index);
                        },
                        isThreeLine: true,
                        tileColor: netralCardColor,
                        leading: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Badge(
                              badgeColor: Colors.orange,
                              position: BadgePosition.topEnd(top: -1, end: -1),
                              child: notifIcons()),
                        ),
                        title: Container(
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
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                DateFormat('d MMM y, HH:mm')
                                    .format(DateTime.now()),
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
                  itemCount: modelView.notifItems.length),
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

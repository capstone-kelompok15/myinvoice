import 'package:flutter/cupertino.dart';
import 'package:myinvoice/view/constant/constant.dart';

class ProfileProvider extends ChangeNotifier {
  List<Map<String, dynamic>> dataAccount = [
    {
      'icon': edit,
      'title': 'Edit Profile',
      'isToogle': false,
    },
    {
      'icon': lock,
      'title': 'Password',
      'isToogle': false,
    },
  ];
  List<Map<String, dynamic>> dataMore = [
    {
      'icon': bell,
      'title': 'Notification',
      'isToogle': true,
    },
    {
      'icon': creditCard,
      'title': 'Payment',
      'isToogle': false,
    },
    {
      'icon': language,
      'title': 'Language',
      'isToogle': false,
    },
    {
      'icon': bell,
      'title': 'Privacy Policy',
      'isToogle': false,
    },
    {
      'icon': help,
      'title': 'Help & Support',
      'isToogle': false,
    },
  ];
}

import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  List<Map<String, dynamic>> dataAccount = [
    {
      'icon': 'assets/icons/fi-rr-pencil.svg',
      'title': 'Edit Profile',
      'isToogle': false,
    },
    {
      'icon': 'assets/icons/fi-rr-lock.svg',
      'title': 'Password',
      'isToogle': false,
    },
  ];
  List<Map<String, dynamic>> dataMore = [
    {
      'icon': 'assets/icons/fi-rr-bell.svg',
      'title': 'Notification',
      'isToogle': true,
    },
    {
      'icon': 'assets/icons/fi-rr-credit-card.svg',
      'title': 'Payment',
      'isToogle': false,
    },
    {
      'icon': 'assets/icons/heroicons_language.svg',
      'title': 'Language',
      'isToogle': false,
    },
    {
      'icon': 'assets/icons/fi-rr-bell.svg',
      'title': 'Privacy Policy',
      'isToogle': false,
    },
    {
      'icon': 'assets/icons/fi-rr-interrogation.svg',
      'title': 'Help & Support',
      'isToogle': false,
    },
  ];
}

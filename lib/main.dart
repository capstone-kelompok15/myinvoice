import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myinvoice/view/screens/home/home_screen.dart';
import 'package:myinvoice/view/screens/splash/splash_screen.dart';
import 'package:myinvoice/view/styles/styles.dart';
import 'package:myinvoice/viewmodel/home_view_model.dart';
<<<<<<< HEAD
import 'package:myinvoice/viewmodel/auth_view_model.dart';
import 'package:myinvoice/viewmodel/invoice_view_model.dart';
import 'package:myinvoice/viewmodel/notification_view_model.dart';
import 'package:myinvoice/viewmodel/profile_view_model.dart';
=======
import 'package:myinvoice/viewmodel/auth_provider.dart';
import 'package:myinvoice/viewmodel/invoice_provider.dart';
import 'package:myinvoice/viewmodel/notification_view_model.dart';
import 'package:myinvoice/viewmodel/profile_provider.dart';
import 'package:myinvoice/viewmodel/report_provider.dart';
>>>>>>> brian/report
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => InvoiceViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationViewModel(),
        ),
           ChangeNotifierProvider(
          create: (context) => ReportProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryBackground,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

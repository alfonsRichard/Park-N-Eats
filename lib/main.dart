import 'package:flutter/material.dart';
import 'package:myapp/ForgotPassword/otpscreen.dart';
import 'package:myapp/ForgotPassword/ForgotwithEmailPage.dart'; // Make sure the import path is correct
import 'package:myapp/splashscreen.dart'; // Adjust the import path as needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park N\' Eats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/forgot-with-email': (context) => const ForgotwithEmailPage(),
        '/otp': (context) => const OTPscreen(),
      },
    );
  }
}

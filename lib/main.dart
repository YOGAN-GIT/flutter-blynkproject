import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'otp_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (_) => WelcomeScreen(),
      '/login': (_) => LoginScreen(),
      '/otp': (_) => OtpScreen(),
      '/home': (_) => HomeScreen(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Roboto'),
  ));
}
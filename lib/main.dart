import 'package:bitebid_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (ctx) => const SplashScreen(),
        '/login':  (ctx) => const LoginScreen(),
        '/signup': (ctx) => const SignupScreen(),
        '/otp':
            (context) =>
                const OtpVerificationScreen(phoneNumber: '+91 1234567890'),
      },
    );
  }
}

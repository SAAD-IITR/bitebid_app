import 'package:bitebid_app/screens/get_started.dart';
import 'package:bitebid_app/screens/home_page.dart';
import 'package:bitebid_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3)); // Show splash for 3 seconds

    if (!mounted) return;

    // Check if user is already logged in
    bool isLoggedIn = await _authService.isLoggedIn();
    User? user = _authService.currentUser;

    if (isLoggedIn && user != null) {
      // User is logged in, navigate to home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => (HomeScreen())),
      );
    } else {
      // User is not logged in, navigate to get started
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GetStarted()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo or Animation
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'bitebid_app',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 246, 117, 91),
              ),
            ),
            const SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 246, 117, 91),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


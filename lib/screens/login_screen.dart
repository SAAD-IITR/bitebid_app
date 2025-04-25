import 'package:flutter/material.dart';
import 'package:bitebid_my/widgets/custom_button.dart';
import 'package:bitebid_my/widgets/phone_input_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _showMockAuthDialog(BuildContext context, String method) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Login via $method"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Future login functionality
                },
                child: const Text('Submit'),
              ),
            ],
          ),
    );
  }

  void _onPhoneContinue(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) => const PhoneInputSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6B35), // Solid Terracotta Orange
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Logo with White Border
              Container(
                width: 125, // Slightly bigger than radius*2
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // White border
                    width: 2.0, // Thin border
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent, // Important
                  backgroundImage: AssetImage('assets/logo2.png'), // Your logo
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to BiteBid 🍽️",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Get exclusive food bids from top restaurants near you",
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Continue with Phone
              CustomButton(
                label: "Continue with Phone Number",
                icon: Icons.phone,
                backgroundColor: Colors.amber,
                textColor: Colors.black,
                onPressed: () => _onPhoneContinue(context),
              ),
              const SizedBox(height: 10),
              const Text("OR", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              // Continue with Google
              CustomButton(
                label: "Continue with Google",
                icon: Icons.g_mobiledata,
                onPressed: () => _showMockAuthDialog(context, "Google"),
              ),
              const SizedBox(height: 10),
              // Continue with Apple
              CustomButton(
                label: "Continue with Apple",
                icon: Icons.apple,
                onPressed: () => _showMockAuthDialog(context, "Apple"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

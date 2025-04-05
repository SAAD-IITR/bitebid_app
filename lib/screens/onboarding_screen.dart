import 'package:bitebid_app/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // App Icon
              Icon(
                Icons.restaurant_menu,
                size: 60,
                color: Color.fromARGB(255, 246, 117, 91),
              ),
              const SizedBox(height: 10),
              // App Name
              Text(
                'BiteBid',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              // Subtitle
              Text(
                'Get the best food deals through real-time bidding',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              // Placeholder for Onboarding Illustration
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.35,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Lottie.asset('assets/animations/food.json'),
                ),
              ),
              const SizedBox(height: 40),
              // Sign Up Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 246, 117, 91),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Log In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 246, 117, 91),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Log In',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 246, 117, 91),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Or Continue With
              Text(
                'or continue with',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(onPressed: () {}, icon: 'G'),
                  const SizedBox(width: 16),
                  SocialButton(onPressed: () {}, icon: '', isApple: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

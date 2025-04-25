import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _start = 30;
  bool _resendEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.doWhile(() async {
      if (_start == 0) {
        setState(() {
          _resendEnabled = true;
        });
        return false;
      } else {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          _start--;
        });
        return true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/logo2.png', height: 180),
              const SizedBox(height: 30),
              Text(
                "Verify Your Phone Number",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "We've sent a 4-digit code to",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.phoneNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: AppColors.accent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        index < _otpController.text.length
                            ? _otpController.text[index]
                            : '',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _resendEnabled
                  ? TextButton(
                    onPressed: () {
                      setState(() {
                        _start = 30;
                        _resendEnabled = false;
                      });
                      startTimer();
                    },
                    child: Text(
                      "Resend Code",
                      style: TextStyle(color: AppColors.accent),
                    ),
                  )
                  : Text(
                    "Didn't receive it? Resend in 00:${_start.toString().padLeft(2, '0')}",
                    style: TextStyle(color: Colors.white70),
                  ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Verify & Continue",
                backgroundColor: Colors.amber,
                textColor: Colors.black,
                onPressed: () {
                  // TODO: OTP verification logic
                },
              ),
              const SizedBox(height: 20),
              Text(
                "🔒 Your number is safe with BiteBid",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

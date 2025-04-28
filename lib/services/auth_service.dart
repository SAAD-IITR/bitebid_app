import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream to listen to auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Phone verification variables
  String? _verificationId;
  int? _resendToken;
  Timer? _resendTimer;

  // Phone verification function
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(String?) onError,
    required Function(UserCredential) onVerified,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This callback is called in two cases:
          // 1. Auto-retrieval - on some Android devices, SMS is automatically detected
          // 2. Instant verification - in some cases phone can be verified without SMS

          try {
            UserCredential userCredential = await _auth.signInWithCredential(credential);
            await saveLoginState(true);
            onVerified(userCredential);
          } catch (e) {
            onError(e.toString());
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          onError(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save verification ID and resend token
          _verificationId = verificationId;
          _resendToken = resendToken;
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Called when the auto-retrieval timeout is reached
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
        forceResendingToken: _resendToken,
      );
    } catch (e) {
      onError(e.toString());
    }
  }

  // Verify OTP code
  Future<UserCredential?> verifyOTPCode(String otp) async {
    try {
      if (_verificationId == null) {
        throw Exception("Verification ID is null. Please request OTP first.");
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Save login state
      await saveLoginState(true);

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print('Sign-in aborted by user');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        print('Missing Google Auth tokens');
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print('User signed in: ${userCredential.user?.email}');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      return userCredential;
    } catch (e) {
      print('Google sign-in error: $e');
      return null;
    }
  }

  static Future<void> signOutWithGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save login state
      await saveLoginState(true);

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  // Register with email and password
  Future<UserCredential> createUserWithEmailAndPassword(
      String email,
      String password,
      String fullName,
      String phoneNumber,
      String? gender,
      ) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile
      await userCredential.user?.updateDisplayName(fullName);

      // Save additional user information to Firestore (optional)
      // This would require adding Firestore setup

      // Save login state
      await saveLoginState(true);

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null; // No error
    } catch (e) {
      print('Password reset error: $e');
      return e.toString(); // Return error message
    }
  }

  // Sign out
  Future<void> signOut() async {
    await saveLoginState(false);
    return await _auth.signOut();
  }

  // Save login state to SharedPreferences
  Future<void> saveLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
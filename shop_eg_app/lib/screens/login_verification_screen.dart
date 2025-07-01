import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class LoginVerificationScreen extends StatelessWidget {
  static const String routeName = '/login_verification';

  const LoginVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for login verification
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Login Verification'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Text(
          'Login Verification Screen',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 24,
            color: ShopEgApp.blackColor,
            shadows: [
              Shadow(
                color: ShopEgApp.goldColor,
                offset: Offset(2, 2),
                blurRadius: 6,
              ),
            ],
          ),
        ).animate().fadeIn(duration: 1000.ms),
      ),
    );
  }
}

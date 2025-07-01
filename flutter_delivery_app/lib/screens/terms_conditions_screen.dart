import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'create_account_screen.dart';
import 'client_sign_up_screen.dart';

class TermsConditionsScreen extends StatelessWidget {
  final String merchantType; // "client", "pharmacy", "supermarket", "restaurant"

  const TermsConditionsScreen({Key? key, required this.merchantType}) : super(key: key);

  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  String get merchantLabel {
    switch (merchantType) {
      case 'client':
        return 'عميل';
      case 'pharmacy':
        return 'صيدلية';
      case 'supermarket':
        return 'سوبرماركت';
      case 'restaurant':
        return 'مطعم';
      default:
        return '';
    }
  }

  void _navigateToSignUp(BuildContext context) {
    if (merchantType == 'client') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ClientSignUpScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CreateAccountScreen(merchantType: merchantType),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: black),
        backgroundColor: white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'SHOP-EG',
              style: TextStyle(
                color: red,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'الشروط والأحكام',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: black,
                  fontFamily: 'Cairo',
                ),
              ).animate().fadeIn(delay: 200.ms),
              const SizedBox(height: 8),
              Text(
                merchantLabel,
                style: TextStyle(
                  fontSize: 20,
                  color: black,
                  fontFamily: 'Cairo',
                ),
              ).animate().fadeIn(delay: 400.ms),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: gold, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''',
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _navigateToSignUp(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                  foregroundColor: white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 12,
                  shadowColor: gold.withOpacity(0.8),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                  ),
                ),
                child: const Text('أوافق وأتابع التسجيل'),
              ).animate().fadeIn(delay: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}

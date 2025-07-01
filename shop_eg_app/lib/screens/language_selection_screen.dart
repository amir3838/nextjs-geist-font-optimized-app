import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class LanguageSelectionScreen extends StatelessWidget {
  static const String routeName = '/language_selection';

  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ShopEgApp.goldColor,
                shadowColor: ShopEgApp.goldColor.withOpacity(0.7),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                // Set language to Arabic and navigate to Login Screen
                NavigationHelper.navigateTo(context, LoginScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('العربية'),
              ),
            ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.5, duration: 800.ms),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ShopEgApp.goldColor,
                shadowColor: ShopEgApp.goldColor.withOpacity(0.7),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                // Set language to English and navigate to Login Screen
                NavigationHelper.navigateTo(context, LoginScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('English'),
              ),
            ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.5, duration: 800.ms),
          ],
        ),
      ),
    );
  }
}

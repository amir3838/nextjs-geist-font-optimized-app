import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../main.dart';

class LogoutScreen extends StatelessWidget {
  static const String routeName = '/settings/logout';

  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for logout screen
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Logout'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ShopEgApp.redColor,
            shadowColor: ShopEgApp.redColor.withOpacity(0.7),
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
            // Logout logic here
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text('Confirm Logout'),
          ),
        ).animate().fadeIn(duration: 1000.ms),
      ),
    );
  }
}

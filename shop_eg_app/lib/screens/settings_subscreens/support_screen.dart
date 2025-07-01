import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../main.dart';

class SupportScreen extends StatelessWidget {
  static const String routeName = '/settings/support';

  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for support screen
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Support'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Text(
          'Support Screen',
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

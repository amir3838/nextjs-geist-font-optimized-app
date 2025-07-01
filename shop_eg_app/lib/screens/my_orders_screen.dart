import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class MyOrdersScreen extends StatelessWidget {
  static const String routeName = '/my_orders';

  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for My Orders screen
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Text(
          'My Orders Screen',
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

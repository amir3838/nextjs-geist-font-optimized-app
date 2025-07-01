import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const String routeName = '/order_confirmation';

  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for order confirmation
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Order Confirmation'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: ShopEgApp.goldColor,
            ),
            const SizedBox(height: 24),
            Text(
              'Your order has been placed successfully!',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                NavigationHelper.navigateTo(context, MainDashboardScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Back to Dashboard'),
              ),
            ).animate().fadeIn(duration: 1000.ms),
          ],
        ),
      ),
    );
  }
}

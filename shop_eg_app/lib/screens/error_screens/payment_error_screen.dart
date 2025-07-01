import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../main.dart';

class PaymentErrorScreen extends StatelessWidget {
  static const String routeName = '/error/payment_error';

  const PaymentErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for payment error with alternative payment options
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Payment Error'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment Error Occurred',
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
                // Alternative payment options logic here
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Try Alternative Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

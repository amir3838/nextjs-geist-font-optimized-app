import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for checkout screen with payment and address confirmation
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ShopEgApp.blackColor,
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Cash'),
              leading: Radio(
                value: 'cash',
                groupValue: 'cash', // default selected
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Card on Delivery'),
              leading: Radio(
                value: 'card',
                groupValue: 'cash',
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Confirm Address',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ShopEgApp.blackColor,
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: ShopEgApp.goldColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '123 Main Street, Cairo, Egypt',
                style: TextStyle(fontFamily: 'Cairo', fontSize: 16),
              ),
            ),
            const Spacer(),
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
                NavigationHelper.navigateTo(context, OrderConfirmationScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Place Order'),
              ),
            ).animate().fadeIn(duration: 1000.ms),
          ],
        ),
      ),
    );
  }
}

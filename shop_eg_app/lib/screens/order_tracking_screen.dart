import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class OrderTrackingScreen extends StatelessWidget {
  static const String routeName = '/order_tracking';

  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for order tracking with status updates
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Order Tracking'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.inbox),
              title: const Text('Received & Preparing'),
              trailing: Icon(Icons.check, color: ShopEgApp.goldColor),
            ),
            ListTile(
              leading: const Icon(Icons.kitchen),
              title: const Text('Ready for Delivery'),
              trailing: Icon(Icons.check, color: ShopEgApp.goldColor),
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining),
              title: const Text('With Rider'),
              trailing: Icon(Icons.check, color: ShopEgApp.goldColor),
            ),
            ListTile(
              leading: const Icon(Icons.celebration),
              title: const Text('Delivered Successfully'),
              trailing: Icon(Icons.check, color: ShopEgApp.goldColor),
            ),
          ],
        ).animate().fadeIn(duration: 1000.ms),
      ),
    );
  }
}

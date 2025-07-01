import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class NegotiationScreen extends StatelessWidget {
  static const String routeName = '/negotiation';

  const NegotiationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for negotiation screen with chat/call and agreement/decline buttons
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Negotiation'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Receive Chat/Call',
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    // Agreement logic - continue
                    NavigationHelper.navigateTo(context, OrderTrackingScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Agreement'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shadowColor: Colors.red.withOpacity(0.7),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    // Decline logic - retry
                    NavigationHelper.navigateTo(context, StoreSearchScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Decline'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

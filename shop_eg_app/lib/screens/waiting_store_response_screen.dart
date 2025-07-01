import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class WaitingStoreResponseScreen extends StatelessWidget {
  static const String routeName = '/waiting_store_response';

  const WaitingStoreResponseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for waiting for store response with accept, reject, conditional buttons
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Waiting for Store Response'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Waiting for store response...',
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
                    primary: Colors.green,
                    shadowColor: Colors.green.withOpacity(0.7),
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
                    // Accept logic - navigate to order tracking
                    NavigationHelper.navigateTo(context, OrderTrackingScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Accept'),
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
                    // Reject logic - next store
                    NavigationHelper.navigateTo(context, StoreSearchScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Reject'),
                  ),
                ),
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
                    // Conditional logic - negotiation screen
                    NavigationHelper.navigateTo(context, NegotiationScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Conditional'),
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

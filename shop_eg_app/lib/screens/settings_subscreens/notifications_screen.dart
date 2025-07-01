import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../main.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = '/settings/notifications';

  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for notifications settings
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: Text(
          'Notifications Screen',
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

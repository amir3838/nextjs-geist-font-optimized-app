import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class LocationPermissionScreen extends StatelessWidget {
  static const String routeName = '/location_permission';

  const LocationPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for location permission
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Location Permission'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Center(
        child: ElevatedButton(
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
            // Logic to request location permission and navigate to Main Dashboard
            NavigationHelper.navigateTo(context, MainDashboardScreen.routeName);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text('Allow Location Access'),
          ),
        ).animate().fadeIn(duration: 1000.ms),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class MainDashboardScreen extends StatelessWidget {
  static const String routeName = '/main_dashboard';

  const MainDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for main dashboard with navigation buttons to product categories and other screens
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Main Dashboard'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
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
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                NavigationHelper.navigateTo(context, PharmacyProductsScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Pharmacy Products'),
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 16),
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
                NavigationHelper.navigateTo(context, SupermarketProductsScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Supermarket Products'),
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 16),
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
                NavigationHelper.navigateTo(context, RestaurantProductsScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Restaurant Products'),
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 16),
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
                NavigationHelper.navigateTo(context, CartScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Cart'),
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 16),
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
                NavigationHelper.navigateTo(context, MyOrdersScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('My Orders'),
              ),
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 16),
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
                NavigationHelper.navigateTo(context, SettingsScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Settings'),
              ),
            ).animate().fadeIn(duration: 800.ms),
          ],
        ),
      ),
    );
  }
}

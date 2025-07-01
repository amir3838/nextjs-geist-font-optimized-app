import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for Settings screen with navigation to sub-screens
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ListTile(
            title: const Text('Profile'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/profile'),
          ),
          ListTile(
            title: const Text('Saved Addresses'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/saved_addresses'),
          ),
          ListTile(
            title: const Text('Payment Methods'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/payment_methods'),
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/language'),
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/notifications'),
          ),
          ListTile(
            title: const Text('Support'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/support'),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => NavigationHelper.navigateTo(context, '/settings/logout'),
          ),
        ],
      ).animate().fadeIn(duration: 800.ms),
    );
  }
}

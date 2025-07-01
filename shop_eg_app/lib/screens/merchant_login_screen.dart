import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class MerchantLoginScreen extends StatefulWidget {
  static const String routeName = '/merchant_login';

  const MerchantLoginScreen({Key? key}) : super(key: key);

  @override
  State<MerchantLoginScreen> createState() => _MerchantLoginScreenState();
}

class _MerchantLoginScreenState extends State<MerchantLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Merchant Login'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: ShopEgApp.goldColor, width: 2),
                  ),
                  filled: true,
                  fillColor: ShopEgApp.whiteColor,
                ),
                style: const TextStyle(fontFamily: 'Cairo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value ?? '';
                },
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.5, duration: 800.ms),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: ShopEgApp.goldColor, width: 2),
                  ),
                  filled: true,
                  fillColor: ShopEgApp.whiteColor,
                ),
                obscureText: true,
                style: const TextStyle(fontFamily: 'Cairo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value ?? '';
                },
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.5, duration: 800.ms),
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
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Navigate to Merchant Dashboard
                    NavigationHelper.navigateTo(context, MerchantDashboardScreen.routeName);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Login'),
                ),
              ).animate().fadeIn(duration: 1000.ms),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = '/create_account';

  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Create Account'),
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
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: ShopEgApp.goldColor, width: 2),
                  ),
                  filled: true,
                  fillColor: ShopEgApp.whiteColor,
                ),
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontFamily: 'Cairo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value ?? '';
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
                    // Navigate to Phone Verification Screen
                    NavigationHelper.navigateTo(context, PhoneVerificationScreen.routeName);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Create Account'),
                ),
              ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.5, duration: 1000.ms),
            ],
          ),
        ),
      ),
    );
  }
}

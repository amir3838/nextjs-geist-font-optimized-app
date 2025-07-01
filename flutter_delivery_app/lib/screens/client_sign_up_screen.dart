import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientSignUpScreen extends StatefulWidget {
  const ClientSignUpScreen({Key? key}) : super(key: key);

  @override
  State<ClientSignUpScreen> createState() => _ClientSignUpScreenState();
}

class _ClientSignUpScreenState extends State<ClientSignUpScreen> {
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool agreeTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate() || !agreeTerms) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await Supabase.instance.client.auth.signUp(
        emailController.text.trim(),
        passwordController.text,
        options: AuthOptions(
          data: {'phone': phoneController.text.trim()},
        ),
      );
      if (response.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.error!.message)),
        );
      } else {
        // Navigate to client home screen or next step
        Navigator.of(context).popUntil((route) => route.isFirst);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم التسجيل بنجاح')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "البريد الإلكتروني",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 3),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || !RegExp(r'^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$').hasMatch(value)) {
                      return 'يرجى إدخال بريد إلكتروني صحيح';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "كلمة المرور",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 3),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: gold,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 16),

                // Confirm Password
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: "تأكيد كلمة المرور",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 3),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: gold,
                      ),
                      onPressed: _toggleConfirmPasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'كلمتا المرور غير متطابقتين';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 16),

                // Phone Number
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "رقم الهاتف",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: gold, width: 3),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || !RegExp(r'^\+20\d{9,}$').hasMatch(value)) {
                      return 'يرجى إدخال رقم هاتف صحيح';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 500.ms),

                const SizedBox(height: 16),

                // Terms and Conditions Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: agreeTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeTerms = value ?? false;
                        });
                      },
                      activeColor: red,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "لقد قرأت وأوافق على الشروط والأحكام",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 600.ms),

                const SizedBox(height: 24),

                // Proceed to Registration Button
                ElevatedButton(
                  onPressed: (_formKey.currentState?.validate() == true && agreeTerms && !_isLoading)
                      ? _signUp
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gold,
                    foregroundColor: black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 12,
                    shadowColor: gold.withOpacity(0.8),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: black)
                      : const Text('المتابعة للتسجيل'),
                ).animate().fadeIn(delay: 700.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

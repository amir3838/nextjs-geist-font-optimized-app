import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController(text: "+20");
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement login logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Promo image
              Center(
                child: Image.asset(
                  'assets/images/promo.png',
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 24),

              // Title
              Text(
                "تسجيل الدخول",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),

              const SizedBox(height: 24),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Phone number input
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "رقم الهاتف (+20)",
                        prefixText: "+20 ",
                        prefixStyle: TextStyle(color: gold, fontWeight: FontWeight.bold),
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
                    ),

                    const SizedBox(height: 16),

                    // Password input
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
                    ),

                    const SizedBox(height: 8),

                    // Forgot password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implement forgot password
                        },
                        child: Text(
                          "نسيت كلمة المرور؟",
                          style: TextStyle(color: red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Login button
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 12,
                        shadowColor: gold.withOpacity(0.8),
                        backgroundColor: red,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      child: const Text("تسجيل الدخول"),
                    ),

                    const SizedBox(height: 24),

                    // Divider with "or"
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey[400])),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("أو"),
                        ),
                        Expanded(child: Divider(color: Colors.grey[400])),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Create new account button
                    OutlinedButton(
                      onPressed: () {
                        // TODO: Navigate to create account screen
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: red, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "إنشاء حساب جديد",
                        style: TextStyle(color: red, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Quick login options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            // TODO: Google login
                          },
                          icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                          iconSize: 32,
                        ),
                        const SizedBox(width: 24),
                        IconButton(
                          onPressed: () {
                            // TODO: Facebook login
                          },
                          icon: const FaIcon(FontAwesomeIcons.facebookF, color: Colors.blue),
                          iconSize: 32,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

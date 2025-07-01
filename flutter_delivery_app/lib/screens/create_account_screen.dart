import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountScreen extends StatefulWidget {
  final String merchantType; // 'pharmacy', 'supermarket', 'restaurant'

  const CreateAccountScreen({Key? key, required this.merchantType}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(text: "+20");
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool agreeTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  File? image1;
  File? image2;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(int imageNumber) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          image1 = File(pickedFile.path);
        } else {
          image2 = File(pickedFile.path);
        }
      });
    }
  }

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

  void _submit() {
    if (_formKey.currentState!.validate() && agreeTerms) {
      // TODO: Implement account creation logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
      );
    } else if (!agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يجب الموافقة على الشروط والأحكام')),
      );
    }
  }

  Widget buildImagePicker(String label, int imageNumber) {
    return GestureDetector(
      onTap: () => pickImage(imageNumber),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: gold, width: 2),
          boxShadow: [
            BoxShadow(
              color: gold.withOpacity(0.4),
              offset: const Offset(2, 2),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
          image: (imageNumber == 1 ? image1 : image2) != null
              ? DecorationImage(
                  image: FileImage(imageNumber == 1 ? image1! : image2!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: (imageNumber == 1 ? image1 : image2) == null
            ? Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: gold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
      ),
    ).animate().fadeIn(delay: (imageNumber * 200).ms);
  }

  Widget buildSelectLocationButton() {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement location selection
      },
      icon: const Icon(Icons.location_pin),
      label: const Text("اختر الموقع"),
      style: ElevatedButton.styleFrom(
        backgroundColor: black,
        foregroundColor: white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 12,
        shadowColor: gold.withOpacity(0.8),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ).animate().fadeIn(delay: 600.ms);
  }

  @override
  Widget build(BuildContext context) {
    String title = "إنشاء حساب جديد";
    String phoneLabel = "رقم الهاتف";
    String imageLabel1 = "";
    String imageLabel2 = "";
    Color signUpButtonColor = black;
    Color signUpButtonTextColor = white;

    switch (widget.merchantType) {
      case 'pharmacy':
        phoneLabel = "رقم هاتف الصيدلية";
        imageLabel1 = "الضريبة - الأمام";
        imageLabel2 = "الضريبة - الخلف";
        signUpButtonColor = black;
        signUpButtonTextColor = white;
        break;
      case 'supermarket':
        phoneLabel = "رقم هاتف السوبرماركت";
        imageLabel1 = "هوية المدير";
        imageLabel2 = "صورة الواجهة";
        signUpButtonColor = black;
        signUpButtonTextColor = white;
        break;
      case 'restaurant':
        phoneLabel = "رقم هاتف المطعم";
        imageLabel1 = "هوية المدير";
        imageLabel2 = "صورة المطعم";
        signUpButtonColor = Colors.blue;
        signUpButtonTextColor = white;
        break;
      default:
        phoneLabel = "رقم الهاتف";
        imageLabel1 = "الصورة 1";
        imageLabel2 = "الصورة 2";
        signUpButtonColor = black;
        signUpButtonTextColor = white;
    }

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
                // Promo image
                Center(
                  child: Image.asset(
                    'assets/images/promo.png',
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                ).animate().fadeIn(delay: 100.ms),

                const SizedBox(height: 24),

                // Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 24),

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
                ).animate().fadeIn(delay: 300.ms),

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
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 16),

                // Confirm password
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
                ).animate().fadeIn(delay: 500.ms),

                const SizedBox(height: 16),

                // Phone number
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: phoneLabel,
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
                ).animate().fadeIn(delay: 600.ms),

                const SizedBox(height: 24),

                // Image pickers side by side
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildImagePicker(imageLabel1, 1),
                    buildImagePicker(imageLabel2, 2),
                  ],
                ),

                const SizedBox(height: 24),

                // Select location button
                buildSelectLocationButton(),

                const SizedBox(height: 24),

                // Sign up button
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signUpButtonColor,
                    foregroundColor: signUpButtonTextColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 12,
                    shadowColor: gold.withOpacity(0.8),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  child: const Text("إنشاء حساب"),
                ).animate().fadeIn(delay: 700.ms),

                const SizedBox(height: 16),

                // Login link
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to login screen
                  },
                  child: Text(
                    "هل لديك حساب؟ تسجيل الدخول",
                    style: TextStyle(color: red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  String? selectedLanguage;

  final List<Map<String, String>> languages = [
    {
      'code': 'ar',
      'label': 'العربية',
      'flag': 'assets/images/egypt_flag.png',
    },
    {
      'code': 'en',
      'label': 'English',
      'flag': 'assets/images/uk_flag.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
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
              ).animate().fadeIn(delay: 300.ms),

              const SizedBox(height: 24),

              // Title
              Text(
                "اختر لغتك المفضلة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 24),

              // Language options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: languages.map((lang) {
                  final isSelected = selectedLanguage == lang['code'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang['code'];
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: 140,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [red, gold],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                        color: isSelected ? null : white,
                        border: Border.all(
                          color: isSelected ? gold : black,
                          width: 3,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: gold.withOpacity(0.6),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                )
                              ]
                            : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            lang['flag']!,
                            width: 64,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            lang['label']!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? white : black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(delay: 700.ms);
                }).toList(),
              ),

              const Spacer(),

              // Continue button
              ElevatedButton(
                onPressed: selectedLanguage == null ? null : () {
                  // TODO: Navigate to next screen
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 12,
                  shadowColor: gold.withOpacity(0.8),
                  backgroundColor: selectedLanguage == null ? Colors.grey : red,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                child: const Text("استمر"),
              ).animate().fadeIn(delay: 900.ms),
            ],
          ),
        ),
      ),
    );
  }
}

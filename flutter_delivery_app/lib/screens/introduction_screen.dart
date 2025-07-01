import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  final List<String> features = [
    "توصيل سريع ضمن 7 كيلومترات",
    "منتجات متنوعة من متاجر موثوقة",
    "دفع آمن عند الاستلام",
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
              // Skip button top right
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigate to next screen
                  },
                  child: Text(
                    "تخطي",
                    style: TextStyle(
                      color: red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 300.ms),

              // Promo image
              Image.asset(
                'assets/images/promo.png',
                height: 180,
                fit: BoxFit.contain,
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 24),

              // Title
              Text(
                "تطبيق التوصيل الذكي",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ).animate().fadeIn(delay: 700.ms),

              const SizedBox(height: 12),

              // Description
              Text(
                "اطلب من الصيدليات، السوبرماركت، والمطاعم بسهولة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ).animate().fadeIn(delay: 900.ms),

              const SizedBox(height: 24),

              // Features list
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: features
                    .map(
                      (feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              feature,
                              style: TextStyle(
                                fontSize: 18,
                                color: black,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 1100.ms),
                    )
                    .toList(),
              ),

              const Spacer(),

              // Get Started button with 3D effect
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to next screen
                },
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
                child: const Text("ابدأ الآن"),
              ).animate().fadeIn(delay: 1300.ms),
            ],
          ),
        ),
      ),
    );
  }
}

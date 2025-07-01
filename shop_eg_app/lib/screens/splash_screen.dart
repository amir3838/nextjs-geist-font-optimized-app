import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      NavigationHelper.navigateTo(context, IntroductionScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      body: Center(
        child: Text(
          'Shop EG',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: ShopEgApp.redColor,
            shadows: [
              Shadow(
                color: ShopEgApp.goldColor,
                offset: Offset(4, 4),
                blurRadius: 8,
              ),
            ],
          ),
        ).animate().fadeIn(duration: 1200.ms).scale(duration: 1200.ms),
      ),
    );
  }
}

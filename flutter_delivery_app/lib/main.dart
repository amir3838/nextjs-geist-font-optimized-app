import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/introduction_screen.dart';

void main() {
  runApp(const SmartDeliveryApp());
}

class SmartDeliveryApp extends StatelessWidget {
  const SmartDeliveryApp({Key? key}) : super(key: key);

  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFFFD700);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: red,
        scaffoldBackgroundColor: white,
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: black,
                displayColor: black,
              ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: red,
          secondary: gold,
          background: white,
          error: Colors.redAccent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: gold, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: gold, width: 3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 3),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: red,
            onPrimary: white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            shadowColor: gold.withOpacity(0.7),
          ),
        ),
      ),
      home: const IntroductionScreen(),
    );
  }
}

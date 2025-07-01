import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product_details';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder UI for product details with add to cart and back to listing buttons
    return Scaffold(
      backgroundColor: ShopEgApp.whiteColor,
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: ShopEgApp.redColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Product Details Screen',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    color: ShopEgApp.blackColor,
                    shadows: [
                      Shadow(
                        color: ShopEgApp.goldColor,
                        offset: Offset(2, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 1000.ms),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    // Add to cart logic here
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Add to Cart'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ShopEgApp.redColor,
                    shadowColor: ShopEgApp.redColor.withOpacity(0.7),
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
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Back to Listing'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

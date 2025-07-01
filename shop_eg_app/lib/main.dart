import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/introduction_screen.dart';
import 'screens/language_selection_screen.dart';
import 'screens/login_screen.dart';
import 'screens/login_verification_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/phone_verification_screen.dart';
import 'screens/location_permission_screen.dart';
import 'screens/main_dashboard_screen.dart';
import 'screens/pharmacy_products_screen.dart';
import 'screens/supermarket_products_screen.dart';
import 'screens/restaurant_products_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/my_orders_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/order_confirmation_screen.dart';
import 'screens/merchant_login_screen.dart';
import 'screens/merchant_dashboard_screen.dart';
import 'screens/merchant_order_details_screen.dart';
import 'screens/conditional_accept_screen.dart';
import 'screens/waiting_customer_response_screen.dart';
import 'screens/store_search_screen.dart';
import 'screens/send_order_nearby_stores_screen.dart';
import 'screens/waiting_store_response_screen.dart';
import 'screens/negotiation_screen.dart';
import 'screens/order_tracking_screen.dart';
import 'screens/settings_subscreens/profile_screen.dart';
import 'screens/settings_subscreens/saved_addresses_screen.dart';
import 'screens/settings_subscreens/payment_methods_screen.dart';
import 'screens/settings_subscreens/language_screen.dart';
import 'screens/settings_subscreens/notifications_screen.dart';
import 'screens/settings_subscreens/support_screen.dart';
import 'screens/settings_subscreens/logout_screen.dart';
import 'screens/my_orders_subscreens/current_orders_screen.dart';
import 'screens/my_orders_subscreens/past_orders_screen.dart';
import 'screens/my_orders_subscreens/canceled_orders_screen.dart';
import 'screens/support_subscreens/faq_screen.dart';
import 'screens/support_subscreens/live_chat_screen.dart';
import 'screens/support_subscreens/contact_support_screen.dart';
import 'screens/error_screens/no_internet_screen.dart';
import 'screens/error_screens/location_failed_screen.dart';
import 'screens/error_screens/no_nearby_stores_screen.dart';
import 'screens/error_screens/all_stores_rejected_screen.dart';
import 'screens/error_screens/payment_error_screen.dart';

void main() {
  runApp(const ShopEgApp());
}

class ShopEgApp extends StatelessWidget {
  const ShopEgApp({Key? key}) : super(key: key);

  static const Color redColor = Color(0xFFFF0000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color goldColor = Color(0xFFFFD700);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop EG App',
      theme: ThemeData(
        primaryColor: redColor,
        scaffoldBackgroundColor: whiteColor,
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: blackColor,
                displayColor: blackColor,
              ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: redColor,
          secondary: goldColor,
          background: whiteColor,
          onPrimary: whiteColor,
          onSecondary: blackColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: goldColor,
            shadowColor: goldColor.withOpacity(0.7),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: goldColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: redColor, width: 2),
          ),
          shadowColor: goldColor.withOpacity(0.7),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        IntroductionScreen.routeName: (context) => const IntroductionScreen(),
        LanguageSelectionScreen.routeName: (context) => const LanguageSelectionScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        LoginVerificationScreen.routeName: (context) => const LoginVerificationScreen(),
        CreateAccountScreen.routeName: (context) => const CreateAccountScreen(),
        PhoneVerificationScreen.routeName: (context) => const PhoneVerificationScreen(),
        LocationPermissionScreen.routeName: (context) => const LocationPermissionScreen(),
        MainDashboardScreen.routeName: (context) => const MainDashboardScreen(),
        PharmacyProductsScreen.routeName: (context) => const PharmacyProductsScreen(),
        SupermarketProductsScreen.routeName: (context) => const SupermarketProductsScreen(),
        RestaurantProductsScreen.routeName: (context) => const RestaurantProductsScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        MyOrdersScreen.routeName: (context) => const MyOrdersScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
        CheckoutScreen.routeName: (context) => const CheckoutScreen(),
        OrderConfirmationScreen.routeName: (context) => const OrderConfirmationScreen(),
        MerchantLoginScreen.routeName: (context) => const MerchantLoginScreen(),
        MerchantDashboardScreen.routeName: (context) => const MerchantDashboardScreen(),
        MerchantOrderDetailsScreen.routeName: (context) => const MerchantOrderDetailsScreen(),
        ConditionalAcceptScreen.routeName: (context) => const ConditionalAcceptScreen(),
        WaitingCustomerResponseScreen.routeName: (context) => const WaitingCustomerResponseScreen(),
        StoreSearchScreen.routeName: (context) => const StoreSearchScreen(),
        SendOrderNearbyStoresScreen.routeName: (context) => const SendOrderNearbyStoresScreen(),
        WaitingStoreResponseScreen.routeName: (context) => const WaitingStoreResponseScreen(),
        NegotiationScreen.routeName: (context) => const NegotiationScreen(),
        OrderTrackingScreen.routeName: (context) => const OrderTrackingScreen(),
        // Settings Sub-screens
        '/settings/profile': (context) => const ProfileScreen(),
        '/settings/saved_addresses': (context) => const SavedAddressesScreen(),
        '/settings/payment_methods': (context) => const PaymentMethodsScreen(),
        '/settings/language': (context) => const LanguageScreen(),
        '/settings/notifications': (context) => const NotificationsScreen(),
        '/settings/support': (context) => const SupportScreen(),
        '/settings/logout': (context) => const LogoutScreen(),
        // My Orders Sub-screens
        '/my_orders/current': (context) => const CurrentOrdersScreen(),
        '/my_orders/past': (context) => const PastOrdersScreen(),
        '/my_orders/canceled': (context) => const CanceledOrdersScreen(),
        // Support Sub-screens
        '/support/faq': (context) => const FAQScreen(),
        '/support/live_chat': (context) => const LiveChatScreen(),
        '/support/contact_support': (context) => const ContactSupportScreen(),
        // Error & Exception Screens
        '/error/no_internet': (context) => const NoInternetScreen(),
        '/error/location_failed': (context) => const LocationFailedScreen(),
        '/error/no_nearby_stores': (context) => const NoNearbyStoresScreen(),
        '/error/all_stores_rejected': (context) => const AllStoresRejectedScreen(),
        '/error/payment_error': (context) => const PaymentErrorScreen(),
      },
    );
  }
}

class NavigationHelper {
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}

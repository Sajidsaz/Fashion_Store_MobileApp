import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'viewmodels/auth_view_model.dart';
import 'viewmodels/cart_view_model.dart';
import 'viewmodels/wishlist_view_model.dart';
import 'viewmodels/shop_view_model.dart';
import 'viewmodels/notification_view_model.dart';
import 'viewmodels/profile_view_model.dart';
import 'viewmodels/order_view_model.dart';
import 'viewmodels/address_view_model.dart';
import 'viewmodels/settings_view_model.dart';

void main() {
  runApp(const HeySazApp());
}

class HeySazApp extends StatelessWidget {
  const HeySazApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ── Global ViewModels ──
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => WishlistViewModel()),
        ChangeNotifierProvider(create: (_) => ShopViewModel()),
        ChangeNotifierProvider(create: (_) => NotificationViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => OrderViewModel()),
        ChangeNotifierProvider(create: (_) => AddressViewModel()),
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
        // Note: SearchViewModel, ProductDetailViewModel, and CheckoutViewModel
        // are created locally per-screen since they are not shared globally.
      ],
      child: MaterialApp(
        title: 'HEYSAZ',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}

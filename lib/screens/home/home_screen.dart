import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/auth_view_model.dart';
import '../../viewmodels/wishlist_view_model.dart';
import '../../models/product_model.dart';
import '../search/search_screen.dart';
import '../shop/shop_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';
import '../product/product_detail_screen.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../auth/guest_screen.dart';
import '../notifications/notification_screen.dart';
import '../../viewmodels/notification_view_model.dart';
import '../../viewmodels/shop_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabChange(int index) =>
      setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final authVm = context.watch<AuthViewModel>();

    final screens = [
      _HomeTab(onTabChange: _onTabChange),
      const ShopScreen(),
      authVm.isLoggedIn
          ? ProfileScreen(
              onLogout: () => context.read<AuthViewModel>().logout(),
            )
          : GuestScreen(
              onLoginSuccess: () =>
                  context.read<AuthViewModel>().login()),
      const CartScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabChange,
      ),
    );
  }
}

// Home Tab 
class _HomeTab extends StatelessWidget {
  final void Function(int) onTabChange;
  const _HomeTab({required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final shopVm      = context.watch<ShopViewModel>();
    final bestsellers = shopVm.bestsellerProducts;
    final latest      = shopVm.latestProducts;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Header 
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('HEYSAZ',
                        style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const SearchScreen())),
                          child: const Icon(Icons.search, size: 24),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<NotificationViewModel>()
                                .markAllRead();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const NotificationScreen()));
                          },
                          child: Consumer<NotificationViewModel>(
                            builder: (context, notifVm, _) => Stack(
                              children: [
                                const Icon(
                                    Icons.notifications_outlined,
                                    size: 24),
                                if (notifVm.hasUnread)
                                  Positioned(
                                    right: 0, top: 0,
                                    child: Container(
                                      width: 8, height: 8,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ── Hero Banner ──
              // ── Promo Banner ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hero_img.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.55),
                        Colors.transparent],
                      begin: Alignment.centerLeft,
                      end: Alignment.center,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('50% OFF',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      Text('On everything today',
                        style: GoogleFonts.inter(
                          fontSize: 12, color: Colors.white70)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('Get Now',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

              // ── Shop By Category ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Shop By Category',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _CategoryCard(
                      label: 'Men',
                      onTap: () {
                        context
                            .read<ShopViewModel>()
                            .selectCategory('Men');
                        onTabChange(1);
                      },
                    ),
                    const SizedBox(width: 10),
                    _CategoryCard(
                      label: 'Women',
                      onTap: () {
                        context
                            .read<ShopViewModel>()
                            .selectCategory('Women');
                        onTabChange(1);
                      },
                    ),
                    const SizedBox(width: 10),
                    _CategoryCard(
                      label: 'Kids',
                      onTap: () {
                        context
                            .read<ShopViewModel>()
                            .selectCategory('Kids');
                        onTabChange(1);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Bestsellers ──
              _SectionHeader(
                  title: 'Bestsellers',
                  onSeeAll: () => onTabChange(1)),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: bestsellers.length,
                  itemBuilder: (context, index) {
                    final product = bestsellers[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailScreen(
                                      product: product))),
                      child: _ProductCard(product: product),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // ── Latest Collection ──
              _SectionHeader(
                  title: 'Latest Collection',
                  onSeeAll: () => onTabChange(1)),
              const SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: latest.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final product = latest[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailScreen(
                                      product: product))),
                      child: _ProductCard(
                          product: product, compact: true),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  const _SectionHeader(
      {required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: onSeeAll,
            child: Text('See All',
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppTheme.primary)),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _CategoryCard({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.border),
          ),
          alignment: Alignment.center,
          child: Text(label,
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final bool compact;
  const _ProductCard({required this.product, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: compact ? null : 140,
      margin: compact ? null : const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                      color: AppTheme.border,
                      child: const Icon(Icons.image_outlined,
                          size: 40))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(
                    'LKR ${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppTheme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

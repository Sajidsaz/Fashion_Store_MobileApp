import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/search_view_model.dart';
import '../product/product_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchViewModel(),
      child: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody();

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SearchViewModel>();

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Search Bar ──
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      onChanged: (v) =>
                          context.read<SearchViewModel>().onQueryChanged(v),
                      onSubmitted: (v) {
                        context.read<SearchViewModel>().submitSearch(v);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        hintStyle: GoogleFonts.inter(
                            fontSize: 14, color: AppTheme.textSecondary),
                        filled: true,
                        fillColor: AppTheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: AppTheme.border),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        suffixIcon: vm.hasQuery
                            ? GestureDetector(
                                onTap: () {
                                  _controller.clear();
                                  context
                                      .read<SearchViewModel>()
                                      .clearQuery();
                                },
                                child: const Icon(Icons.close, size: 18))
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: vm.hasQuery
                  ? _buildResults(context, vm)
                  : _buildRecent(context, vm),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecent(BuildContext context, SearchViewModel vm) {
    if (vm.recentSearches.isEmpty) {
      return Center(
        child: Text('No recent searches',
            style: GoogleFonts.inter(
                fontSize: 14, color: AppTheme.textSecondary)),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recent Searches',
              style: GoogleFonts.inter(
                  fontSize: 14, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 8),
        ...vm.recentSearches.map((term) => ListTile(
              leading: const Icon(Icons.history,
                  size: 18, color: AppTheme.textSecondary),
              title: Text(term,
                  style: GoogleFonts.inter(fontSize: 13)),
              onTap: () {
                _controller.text = term;
                vm.selectRecent(term);
              },
            )),
      ],
    );
  }

  Widget _buildResults(BuildContext context, SearchViewModel vm) {
    if (!vm.hasResults) {
      return Center(
        child: Text('No products found for "${vm.query}"',
            style: GoogleFonts.inter(
                fontSize: 14, color: AppTheme.textSecondary)),
      );
    }
    return ListView.builder(
      itemCount: vm.searchResults.length,
      itemBuilder: (context, index) {
        final product = vm.searchResults[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(product.image,
                width: 44, height: 44, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(width: 44, color: AppTheme.border)),
          ),
          title: Text(product.name,
              style: GoogleFonts.inter(
                  fontSize: 13, fontWeight: FontWeight.w600)),
          subtitle: Text(
              'LKR ${product.price.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                  fontSize: 12, color: AppTheme.textSecondary)),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(
                  builder: (_) =>
                      ProductDetailScreen(product: product))),
        );
      },
    );
  }
}

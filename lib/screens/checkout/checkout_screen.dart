import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/checkout_view_model.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckoutViewModel(),
      child: const _CheckoutBody(),
    );
  }
}

class _CheckoutBody extends StatefulWidget {
  const _CheckoutBody();

  @override
  State<_CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<_CheckoutBody> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _cityCtrl;
  late final TextEditingController _phoneCtrl;

  @override
  void initState() {
    super.initState();
    final vm = context.read<CheckoutViewModel>();
    _nameCtrl    = TextEditingController(text: vm.name);
    _addressCtrl = TextEditingController(text: vm.address);
    _cityCtrl    = TextEditingController(text: vm.city);
    _phoneCtrl   = TextEditingController(text: vm.phone);

    _nameCtrl.addListener(()    => context.read<CheckoutViewModel>().setName(_nameCtrl.text));
    _addressCtrl.addListener(() => context.read<CheckoutViewModel>().setAddress(_addressCtrl.text));
    _cityCtrl.addListener(()    => context.read<CheckoutViewModel>().setCity(_cityCtrl.text));
    _phoneCtrl.addListener(()   => context.read<CheckoutViewModel>().setPhone(_phoneCtrl.text));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CheckoutViewModel>();

    if (vm.orderPlaced) return _buildSuccessScreen(context);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20)),
                  Text('Checkout',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery Address',
                      style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline, size: 20))),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _addressCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Street Address',
                        prefixIcon: Icon(Icons.home_outlined, size: 20))),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _cityCtrl,
                      decoration: const InputDecoration(
                        hintText: 'City',
                        prefixIcon: Icon(Icons.location_city_outlined, size: 20))),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone_outlined, size: 20))),
                    const SizedBox(height: 24),
                    Text('Payment Method',
                      style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _PaymentOption(label: 'Visa',  icon: Icons.credit_card,   value: 'visa', selected: vm.selectedPayment, onTap: vm.selectPayment),
                        const SizedBox(width: 10),
                        _PaymentOption(label: 'Cash',  icon: Icons.money,          value: 'cash', selected: vm.selectedPayment, onTap: vm.selectPayment),
                        const SizedBox(width: 10),
                        _PaymentOption(label: 'Pay',   icon: Icons.phone_android,  value: 'pay',  selected: vm.selectedPayment, onTap: vm.selectPayment),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text('Order Summary',
                      style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.border)),
                      child: Column(children: [
                        _summaryRow('Sub Total',    'LKR 12,500'),
                        _summaryRow('Shipping Fee', 'LKR 350'),
                        _summaryRow('Discount',     '- LKR 625'),
                        const Divider(height: 20),
                        _summaryRow('Total', 'LKR 12,225', isBold: true),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => vm.placeOrder(),
                      child: Text('PLACE ORDER',
                        style: GoogleFonts.inter(
                          letterSpacing: 1.5, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: isBold ? AppTheme.textPrimary : AppTheme.textSecondary,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildSuccessScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100, height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8F5E9), shape: BoxShape.circle),
                  child: const Icon(Icons.check_circle,
                    size: 60, color: Colors.green)),
                const SizedBox(height: 24),
                Text('Order Placed!',
                  style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(
                  'Your order has been placed successfully.\nWe will deliver it soon!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    height: 1.6)),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () =>
                    Navigator.popUntil(context, (r) => r.isFirst),
                  child: Text('BACK TO HOME',
                    style: GoogleFonts.inter(
                      letterSpacing: 1.5, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;
  final String selected;
  final Function(String) onTap;
  const _PaymentOption({
    required this.label,
    required this.icon,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == selected;
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.border)),
        child: Row(children: [
          Icon(icon, size: 18,
            color: isSelected ? Colors.white : AppTheme.textSecondary),
          const SizedBox(width: 6),
          Text(label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppTheme.textPrimary)),
        ]),
      ),
    );
  }
}

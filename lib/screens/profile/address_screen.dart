import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/address_view_model.dart';
import '../../models/address_model.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AddressViewModel>();

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20)),
                  Text('Address',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            // ── Address List ──
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: vm.addresses.length,
                itemBuilder: (context, index) {
                  final addr      = vm.addresses[index];
                  final isDefault = index == vm.defaultIndex;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isDefault
                          ? AppTheme.primary : AppTheme.border,
                        width: isDefault ? 1.5 : 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(addr.name,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                if (isDefault)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primary,
                                      borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Text('Default',
                                      style: GoogleFonts.inter(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                                  ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () =>
                                    vm.removeAddress(index),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    size: 18, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(addr.address,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppTheme.textSecondary)),
                        Text(addr.city,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppTheme.textSecondary)),
                        Text(addr.phone,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppTheme.textSecondary)),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => vm.setDefault(index),
                          child: Text(
                            isDefault
                              ? '✓ Default Address'
                              : 'Set as Default',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDefault
                                ? Colors.green
                                : AppTheme.textSecondary)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ── Add New Address Button ──
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () => _showAddAddressSheet(context, vm),
                icon: const Icon(Icons.add, size: 18),
                label: Text('ADD NEW ADDRESS',
                  style: GoogleFonts.inter(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddAddressSheet(BuildContext context, AddressViewModel vm) {
    final addressCtrl  = TextEditingController();
    final cityCtrl     = TextEditingController();
    final phoneCtrl    = TextEditingController();
    bool  isDefault    = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            left: 20, right: 20, top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New Address',
                      style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close)),
                  ],
                ),
                const SizedBox(height: 16),

                _sheetField('Full Address', addressCtrl,
                  Icons.home_outlined),
                const SizedBox(height: 12),
                _sheetField('City', cityCtrl,
                  Icons.location_city_outlined),
                const SizedBox(height: 12),
                _sheetField('Phone Number', phoneCtrl,
                  Icons.phone_outlined),
                const SizedBox(height: 12),

                // Default toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Set as Default',
                      style: GoogleFonts.inter(fontSize: 13)),
                    Switch(
                      value: isDefault,
                      activeColor: AppTheme.primary,
                      onChanged: (v) =>
                        setModalState(() => isDefault = v),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: () {
                    if (addressCtrl.text.isNotEmpty) {
                      vm.addAddress(
                        Address(
                          name:    'S. Sajith Ahamed',
                          address: addressCtrl.text,
                          city:    cityCtrl.text,
                          phone:   phoneCtrl.text,
                        ),
                        isDefault: isDefault,
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Text('ADD ADDRESS',
                    style: GoogleFonts.inter(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    ).whenComplete(() {
      addressCtrl.dispose();
      cityCtrl.dispose();
      phoneCtrl.dispose();
    });
  }

  Widget _sheetField(String hint, TextEditingController controller,
      IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, size: 20),
      ),
    );
  }
}

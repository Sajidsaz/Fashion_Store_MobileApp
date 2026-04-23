import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/profile_view_model.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _dobCtrl;

  @override
  void initState() {
    super.initState();
    final vm = context.read<ProfileViewModel>();
    _nameCtrl  = TextEditingController(text: vm.name);
    _emailCtrl = TextEditingController(text: vm.email);
    _phoneCtrl = TextEditingController(text: vm.phone);
    _dobCtrl   = TextEditingController(text: vm.dob);

    _nameCtrl.addListener(()  => context.read<ProfileViewModel>().setName(_nameCtrl.text));
    _emailCtrl.addListener(() => context.read<ProfileViewModel>().setEmail(_emailCtrl.text));
    _phoneCtrl.addListener(() => context.read<ProfileViewModel>().setPhone(_phoneCtrl.text));
    _dobCtrl.addListener(()   => context.read<ProfileViewModel>().setDob(_dobCtrl.text));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _dobCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

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
                  Text('My Profile',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      vm.saveProfile();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile saved'),
                          duration: Duration(seconds: 1)));
                    },
                    child: Text('Save',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: AppTheme.surface,
                            child: const Icon(Icons.person,
                              size: 50, color: AppTheme.textSecondary)),
                          Positioned(
                            bottom: 0, right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: AppTheme.primary,
                                shape: BoxShape.circle),
                              child: const Icon(Icons.camera_alt,
                                size: 14, color: Colors.white))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    _label('Full Name'),
                    _field(_nameCtrl, 'Full Name'),
                    const SizedBox(height: 16),

                    _label('Email Address'),
                    _field(_emailCtrl, 'Email',
                      keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 16),

                    _label('Phone Number'),
                    _field(_phoneCtrl, 'Phone',
                      keyboardType: TextInputType.phone),
                    const SizedBox(height: 16),

                    _label('Date of Birth'),
                    _field(_dobCtrl, 'DD/MM/YYYY'),
                    const SizedBox(height: 16),

                    _label('Gender'),
                    Row(
                      children: ['Male', 'Female', 'Other'].map((g) {
                        final isSelected = g == vm.selectedGender;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () => vm.selectGender(g),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                  ? AppTheme.primary : AppTheme.surface,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                    ? AppTheme.primary : AppTheme.border)),
                              child: Text(g,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: isSelected
                                    ? Colors.white : AppTheme.textPrimary,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppTheme.textSecondary)),
  );

  Widget _field(TextEditingController ctrl, String hint,
      {TextInputType? keyboardType}) {
    return TextField(
      controller: ctrl,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hint),
    );
  }
}

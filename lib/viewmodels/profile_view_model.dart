import 'package:flutter/foundation.dart';

class ProfileViewModel extends ChangeNotifier {
  // ── State ──
  String _name           = 'S. Sajith Ahamed';
  String _email          = 'heysaz@gmail.com';
  String _phone          = '+94 77 123 4567';
  String _dob            = '01/01/2000';
  String _selectedGender = 'Male';
  bool   _isDirty        = false;

  // ── Getters ──
  String get name           => _name;
  String get email          => _email;
  String get phone          => _phone;
  String get dob            => _dob;
  String get selectedGender => _selectedGender;
  bool   get isDirty        => _isDirty;

  // ── Setters ──
  void setName(String v)  { _name  = v; _isDirty = true; notifyListeners(); }
  void setEmail(String v) { _email = v; _isDirty = true; notifyListeners(); }
  void setPhone(String v) { _phone = v; _isDirty = true; notifyListeners(); }
  void setDob(String v)   { _dob   = v; _isDirty = true; notifyListeners(); }

  // ── Actions ──
  void selectGender(String gender) {
    _selectedGender = gender;
    _isDirty = true;
    notifyListeners();
  }

  void saveProfile() {
    // Phase 2: persist to Firestore
    _isDirty = false;
    notifyListeners();
  }
}

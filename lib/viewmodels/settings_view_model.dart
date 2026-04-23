import 'package:flutter/foundation.dart';

class SettingsViewModel extends ChangeNotifier {
  bool   _notifications = true;
  bool   _darkMode      = false;
  bool   _orderUpdates  = true;
  bool   _promotions    = false;
  String _language      = 'English';

  bool   get notifications => _notifications;
  bool   get darkMode      => _darkMode;
  bool   get orderUpdates  => _orderUpdates;
  bool   get promotions    => _promotions;
  String get language      => _language;

  void setNotifications(bool v) { _notifications = v; notifyListeners(); }
  void setDarkMode(bool v)      { _darkMode      = v; notifyListeners(); }
  void setOrderUpdates(bool v)  { _orderUpdates  = v; notifyListeners(); }
  void setPromotions(bool v)    { _promotions    = v; notifyListeners(); }
  void setLanguage(String v)    { _language      = v; notifyListeners(); }
}

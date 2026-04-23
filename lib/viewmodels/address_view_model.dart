import 'package:flutter/foundation.dart';
import '../models/address_model.dart';

class AddressViewModel extends ChangeNotifier {
  final List<Address> _addresses = [
    const Address(
      name:    'S. Sajith Ahamed',
      address: '923 S Chugach St APT 10, Alaska Hills',
      city:    'Anchorage, AK 99503',
      phone:   '+94 77 123 4567',
    ),
    const Address(
      name:    'S. Sajith Ahamed',
      address: '925 Ridge Top Dr, workspace Al Inc',
      city:    'Anchorage, AK 99504',
      phone:   '+94 77 987 6543',
    ),
  ];

  int _defaultIndex = 0;

  List<Address> get addresses    => List.unmodifiable(_addresses);
  int           get defaultIndex => _defaultIndex;

  void addAddress(Address address, {bool isDefault = false}) {
    _addresses.add(address);
    if (isDefault) _defaultIndex = _addresses.length - 1;
    notifyListeners();
  }

  void removeAddress(int index) {
    _addresses.removeAt(index);
    if (_defaultIndex >= _addresses.length) {
      _defaultIndex = _addresses.isEmpty ? 0 : _addresses.length - 1;
    }
    notifyListeners();
  }

  void setDefault(int index) {
    _defaultIndex = index;
    notifyListeners();
  }
}

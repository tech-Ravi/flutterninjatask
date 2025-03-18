import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  bool _isLoading = true;

  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

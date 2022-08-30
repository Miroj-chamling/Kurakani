import 'package:flutter/material.dart';
import 'package:kurakani/constants.dart';

class ViewModel extends ChangeNotifier {
  bool _isVisible = false;
  get isVisible => _isVisible;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  bool _isValidEmail = false;
  get isValidEmail => _isValidEmail;
  void isValid(String inputEmail) {
    for (var email in validEmails) {
      if (inputEmail == email) {
        _isValidEmail = true;
      } else {
        _isValidEmail = false;
      }
    }
    notifyListeners();
  }
}

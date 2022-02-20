import 'package:athlon_task/shared/utils/password_validation.dart';
import 'package:flutter/widgets.dart';

class PasswordTextFormFieldState extends ChangeNotifier {
  PasswordTextFormFieldState({String? initialPassword})
      : _password = initialPassword ?? '';

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  void changeObscureText() {
    _obscureText = !obscureText;
    notifyListeners();
  }

  String _password;
  String get password => _password;
  set password(String password) {
    _password = password;
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }

  String? _error;
  String? get error => _error;
  set error(String? error) {
    _error = error;
    notifyListeners();
  }

  bool isPasswordValid() {
    final validationError = PasswordValidator.validatePassword(_password);
    if (validationError != null) {
      switch (validationError) {
        case PasswordValidationError.empty:
          _error = 'Please fill password';
          break;
        case PasswordValidationError.invalid:
          _error = 'Invalid password';
          break;
      }
      notifyListeners();
      return false;
    }
    return true;
  }
}

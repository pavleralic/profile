import 'package:athlon_task/shared/utils/email_validation.dart';
import 'package:flutter/cupertino.dart';

class EmailTextFormFieldState extends ChangeNotifier {
  EmailTextFormFieldState({required String initialEmail})
      : _email = initialEmail;

  String _email;
  String get email => _email;
  set email(String email) {
    _email = email;
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

  bool isEmailValid() {
    final validationError = EmailValidator.validateEmail(email);
    if (validationError != null) {
      switch (validationError) {
        case EmailValidationError.empty:
          _error = 'Please fill email';
          break;
        case EmailValidationError.invalid:
          _error = 'Invalid email';
          break;
      }
      notifyListeners();
      return false;
    }
    return true;
  }
}

import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/presentation/widgets/email/email_text_form_state.dart';
import 'package:athlon_task/presentation/widgets/password/password_text_form_state.dart';
import 'package:athlon_task/shared/constants/preferences.dart';
import 'package:athlon_task/shared/library/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  final AuthService _authService;
  final EmailTextFormFieldState _emailState;
  final PasswordTextFormFieldState _passwordState;
  final LocalStorage _storage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  LoginState(
      {required AuthService authService,
      required EmailTextFormFieldState emailModel,
      required PasswordTextFormFieldState passwordModel,
      required LocalStorage storage})
      : _authService = authService,
        _emailState = emailModel,
        _passwordState = passwordModel,
        _storage = storage;

  void login() async {
    if (!_emailState.isEmailValid()) return;
    if (!_passwordState.isPasswordValid()) return;
    isLoading = true;

    final email = _emailState.email;
    final password = _passwordState.password;

    await _storage.save(key: Preferences.email, value: email);
    await _storage.save(key: Preferences.password, value: password);
    try {
      await _storage.save(key: Preferences.isLoggedIn, value: "loggedIn");
      await _authService.login(email: email, password: password);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _emailState.error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _passwordState.error = 'Wrong password provided for that user.';
      } else {
        _emailState.error = e.message;
      }
    } catch (e) {
      _emailState.error = e.toString();
    }
    isLoading = false;
  }
}

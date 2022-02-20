import 'dart:async';

import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/shared/constants/preferences.dart';
import 'package:athlon_task/shared/library/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  AuthState({required AuthService authService}) : _authService = authService {
    observeAuthStateChanges();
  }

  final AuthService _authService;
  final LocalStorage _localStorage = LocalStorage();

  StreamSubscription<User?>? _authStateSubscription;
  
  User? _currentUser;
  User? get currentUser => _currentUser;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;

  String _password = '';
  String get password => _password;

  bool _didFetchInitialAuthData = false;
  bool get didFetchInitialAuthData => _didFetchInitialAuthData;

  void observeAuthStateChanges() async {
    _isLoggedIn = await _localStorage.read(Preferences.isLoggedIn) != null;

    if (_authStateSubscription != null) {
      _authStateSubscription?.cancel();
    }
    _authStateSubscription =
        _authService.authStateChanges().listen((user) async {
      _email = await _localStorage.read(Preferences.email) ?? '';
      _password = await _localStorage.read(Preferences.password) ?? '';
      _didFetchInitialAuthData = true;
      if (_currentUser == null && user != null) {
        _isLoggedIn = true;
      }
      _currentUser = user;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    _authStateSubscription = null;
    super.dispose();
  }
}

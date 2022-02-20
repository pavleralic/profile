import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/state/auth_state.dart';
import 'package:athlon_task/shared/constants/preferences.dart';
import 'package:athlon_task/shared/library/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileState extends ChangeNotifier {
  final AuthService _authService;
  final _localStorage = LocalStorage();

  ProfileState(
      {required AuthService authService})
      : _authService = authService;

  void signOut() {
    _authService.signOut();
  }

  void navigateToLoginPage(BuildContext context) async {
    await _localStorage.delete(Preferences.isLoggedIn);
    context.read<AuthState>().isLoggedIn = false;
  }
}

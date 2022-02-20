import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/presentation/screens/profile/profile_state.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProfileState>();
    final authService = context.watch<AuthService>();
    return MaterialButton(
        color: AppColors.blue,
        height: 48.0,
        minWidth: 158.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Text(authService.currentUser != null ? 'Log Out' : 'Log In',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w500)),
        onPressed: () => authService.currentUser != null
            ? state.signOut()
            : state.navigateToLoginPage(context));
  }
}

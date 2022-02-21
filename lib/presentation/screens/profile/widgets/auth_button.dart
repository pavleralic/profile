import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/presentation/screens/profile/profile_state.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
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
        height: Dimens.megaLarge,
        minWidth: 158.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.tiny)),
        child: Text(authService.currentUser != null ? 'Log Out' : 'Log In',
            style: AthlonTypo.defaultStyle.copyWith(color: AppColors.white)),
        onPressed: () => authService.currentUser != null
            ? state.signOut()
            : state.navigateToLoginPage(context));
  }
}

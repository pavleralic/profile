import 'package:athlon_task/presentation/screens/login/login_state.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginState>();
    return MaterialButton(
        color: AppColors.blue,
        height: 48.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: state.isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(tr('login.login'),
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
        onPressed: () => state.isLoading ? null : state.login());
  }
}

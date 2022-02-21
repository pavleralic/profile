import 'package:athlon_task/presentation/screens/login/login_state.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
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
        height: Dimens.megaLarge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.tiny)),
        child: state.isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(tr('login.login'),
                style:
                    AthlonTypo.defaultStyle.copyWith(color: AppColors.white)),
        onPressed: () => state.isLoading ? null : state.login());
  }
}

import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text('Forgot Password',
            style: AthlonTypo.defaultStyle.copyWith(color: AppColors.blue)),
        onPressed: () {});
  }
}

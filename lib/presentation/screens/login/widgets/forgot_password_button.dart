import 'package:athlon_task/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text('Forgot Password',
            style: TextStyle(fontSize: 16.0, color: AppColors.blue)),
        onPressed: () {});
  }
}

import 'package:athlon_task/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeCredentialsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: MaterialButton(
          padding: EdgeInsets.zero,
          minWidth: 0.0,
          height: 0.0,
          child: Text('Change',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.blue, fontWeight: FontWeight.w500)),
          onPressed: () {}),
    );
  }
}

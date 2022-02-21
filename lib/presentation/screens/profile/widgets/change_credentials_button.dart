import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeCredentialsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: MaterialButton(
          padding: EdgeInsets.zero,
          minWidth: Dimens.zero,
          height: Dimens.zero,
          child: Text('Change',
              style: AthlonTypo.defaultStyle.copyWith(
                  color: AppColors.blue, fontWeight: FontWeight.w500)),
          onPressed: () {}),
    );
  }
}

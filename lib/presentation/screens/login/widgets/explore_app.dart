import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreAppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.megaLarge,
      child: OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.tiny),
          ),
          side: BorderSide(width: Dimens.proton, color: AppColors.separator),
        ),
        child: Text(tr('login.explore_the_app'), style: AthlonTypo.lightStyle),
      ),
    );
  }
}

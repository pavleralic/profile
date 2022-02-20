import 'package:athlon_task/presentation/widgets/text_form_label.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'password_text_form_state.dart';

class PasswordTextFormField extends StatelessWidget {
  PasswordTextFormField({this.enabled = true, this.bottomPadding});

  final bool enabled;
  final double? bottomPadding;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PasswordTextFormFieldState>();
    controller.text = state.password;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? Dimens.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormLabel('Password'),
          TextFormField(
            controller: controller,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'enter password',
              fillColor: enabled ? AppColors.white : AppColors.disabled,
              errorText: state.error,
              suffixIcon: IconButton(
                  icon: state.obscureText
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility_outlined),
                  onPressed: () => state.changeObscureText()),
            ),
            enabled: enabled,
            obscureText: state.obscureText,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) => state.password = value,
          ),
        ],
      ),
    );
  }
}

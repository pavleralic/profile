import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../text_form_label.dart';
import 'email_text_form_state.dart';

class EmailTextFormField extends StatelessWidget {

  EmailTextFormField({this.enabled = true, this.readOnly = false});
  final bool enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EmailTextFormFieldState>();
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormLabel('Email'),
          TextFormField(
            initialValue: state.email,
            autocorrect: false,
            enabled: enabled,
            readOnly: readOnly,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'e.g. johndoe@gmail.com',
              errorText: state.error,
              fillColor: enabled ? AppColors.white : AppColors.disabled,
            ),
            onChanged: (value) => state.email = value,
          )
        ],
      ),
    );
  }
}

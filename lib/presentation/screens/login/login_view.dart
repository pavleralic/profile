import 'package:athlon_task/presentation/screens/login/widgets/explore_app.dart';
import 'package:athlon_task/presentation/screens/login/widgets/forgot_password_button.dart';
import 'package:athlon_task/presentation/screens/login/widgets/login_button.dart';
import 'package:athlon_task/presentation/widgets/email/email_text_form.dart';
import 'package:athlon_task/presentation/widgets/password/password_text_form.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:athlon_task/shared/constants/styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _buildContentHeader() {
    return Center(
        child: Text(
      'Welcome',
      style: AthlonTypo.largeStyle,
    ));
  }

  _buildSeparator() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child:
                Container(color: AppColors.separator, height: Dimens.proton)),
        Padding(
            padding: EdgeInsets.only(bottom: 3.0),
            child: Text(' or ', style: AthlonTypo.lightStyle)),
        Expanded(
            child:
                Container(color: AppColors.separator, height: Dimens.proton)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContentHeader(),
              SizedBox(height: Dimens.large),
              EmailTextFormField(),
              PasswordTextFormField(),
              LoginButton(),
              SizedBox(height: Dimens.small),
              ForgotPasswordButton(),
              _buildSeparator(),
              SizedBox(height: Dimens.small),
              ExploreAppButton()
            ],
          ),
        ));
  }
}

import 'package:athlon_task/presentation/screens/login/widgets/explore_app.dart';
import 'package:athlon_task/presentation/screens/login/widgets/forgot_password_button.dart';
import 'package:athlon_task/presentation/screens/login/widgets/login_button.dart';
import 'package:athlon_task/presentation/widgets/email/email_text_form.dart';
import 'package:athlon_task/presentation/widgets/password/password_text_form.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Center(
                  child: Text(
                'Welcome',
                style: TextStyle(fontSize: 28.0),
              )),
              SizedBox(height: Dimens.small),
              EmailTextFormField(),
              PasswordTextFormField(),
              LoginButton(),
              SizedBox(height: Dimens.small),
              ForgotPasswordButton(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(color: Color(0xFFC9CDD4), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(' or ',
                          style: TextStyle(
                              fontSize: 16.0, color: Color(0xFF798393)))),
                  Expanded(
                      child: Container(color: Color(0xFFC9CDD4), height: 1.0)),
                ],
              ),
              SizedBox(height: Dimens.small),
              ExploreAppButton()
            ],
          ),
        ));
  }
}

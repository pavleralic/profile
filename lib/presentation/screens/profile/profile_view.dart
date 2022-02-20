import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/presentation/screens/profile/widgets/auth_button.dart';
import 'package:athlon_task/presentation/screens/profile/widgets/avatar/avatar_content.dart';
import 'package:athlon_task/presentation/screens/profile/widgets/change_credentials_button.dart';
import 'package:athlon_task/presentation/widgets/email/email_text_form.dart';
import 'package:athlon_task/presentation/widgets/password/password_text_form.dart';
import 'package:athlon_task/shared/constants/colors.dart';
import 'package:athlon_task/shared/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/avatar/avatar_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Widget> _buildLoggedInContent() {
    return [
      AvatarProvider(child: AvatarSection()),
      EmailTextFormField(readOnly: true),
      PasswordTextFormField(
        enabled: false,
        bottomPadding: 0.0,
      ),
      ChangeCredentialsButton(),
    ];
  }

  List<Widget> _buildLoggedOutContent() {
    return [
      SizedBox(
        height: 160.0,
        child: Center(
          child: Text('You are not logged in',
              style: TextStyle(
                fontSize: 28.0,
              )),
        ),
      ),
      EmailTextFormField(readOnly: true, enabled: false),
      PasswordTextFormField(
        enabled: false,
        bottomPadding: 0.0,
      ),
      ChangeCredentialsButton(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthService>();
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 16.0, color: AppColors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: state.currentUser != null
                          ? _buildLoggedInContent()
                          : _buildLoggedOutContent()),
                  Positioned(bottom: 20.0, right: 0.0, child: AuthButton())
                ],
              )),
        ));
  }
}

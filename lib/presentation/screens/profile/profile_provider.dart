import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/presentation/screens/profile/profile_state.dart';
import 'package:athlon_task/presentation/widgets/email/email_text_form_state.dart';
import 'package:athlon_task/presentation/widgets/password/password_text_form_state.dart';
import 'package:athlon_task/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SettingsProvider extends StatelessWidget {
  final Widget child;

  const SettingsProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmailTextFormFieldState>(
            create: (ctx) => EmailTextFormFieldState(
                initialEmail: ctx.read<AuthState>().email)),
        ChangeNotifierProvider<PasswordTextFormFieldState>(
            create: (ctx) => PasswordTextFormFieldState(
                initialPassword: ctx.read<AuthState>().password)),
        ChangeNotifierProxyProvider3<AuthService, EmailTextFormFieldState,
                PasswordTextFormFieldState, ProfileState>(
            create: (context) =>
                ProfileState(authService: context.read<AuthService>()),
            update: (BuildContext context,
                    AuthService authService,
                    EmailTextFormFieldState emailModel,
                    PasswordTextFormFieldState passwordModel,
                    ProfileState? settingsModel) =>
                ProfileState(authService: authService)),
      ],
      child: child,
    );
  }
}

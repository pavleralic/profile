import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/presentation/screens/login/login_state.dart';
import 'package:athlon_task/presentation/widgets/email/email_text_form_state.dart';
import 'package:athlon_task/presentation/widgets/password/password_text_form_state.dart';
import 'package:athlon_task/shared/library/local_storage.dart';
import 'package:athlon_task/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginProvider extends StatelessWidget {
  final Widget child;

  const LoginProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmailTextFormFieldState>(
            create: (ctx) => EmailTextFormFieldState(
                initialEmail: ctx.read<AuthState>().email)),
        ChangeNotifierProvider<PasswordTextFormFieldState>(
            create: (_) => PasswordTextFormFieldState()),
        ChangeNotifierProxyProvider3<AuthService, EmailTextFormFieldState,
                PasswordTextFormFieldState, LoginState>(
            create: (context) => LoginState(
                authService: context.read<AuthService>(),
                emailModel: context.read<EmailTextFormFieldState>(),
                passwordModel: context.read<PasswordTextFormFieldState>(),
                storage: LocalStorage()),
            update: (BuildContext context,
                    AuthService authService,
                    EmailTextFormFieldState emailModel,
                    PasswordTextFormFieldState passwordModel,
                    LoginState? loginModel) =>
                LoginState(
                    authService: authService,
                    emailModel: emailModel,
                    passwordModel: passwordModel,
                    storage: LocalStorage())),
      ],
      child: child,
    );
  }
}

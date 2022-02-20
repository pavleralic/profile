import 'package:athlon_task/data/backend/auth_service.dart';
import 'package:athlon_task/router/athlon_parser.dart';
import 'package:athlon_task/router/athlon_router.dart';
import 'package:athlon_task/shared/constants/app_theme.dart';
import 'package:athlon_task/state/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routeInformationParser = AthlonParser();

  @override
  Widget build(BuildContext context) {
    context.setLocale(const Locale('en', 'US'));
    return MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
          ChangeNotifierProvider<AuthState>(
              create: (context) =>
                  AuthState(authService: context.read<AuthService>())),
        ],
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerDelegate: AthlonRouterDelegate(),
          routeInformationParser: routeInformationParser,
          theme: athlonThemeData,
        ));
  }
}

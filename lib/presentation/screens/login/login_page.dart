import 'package:athlon_task/presentation/screens/login/login_provider.dart';
import 'package:athlon_task/presentation/screens/login/login_view.dart';
import 'package:athlon_task/shared/page_route_builder.dart';
import 'package:flutter/material.dart';

class LoginPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return SlideRightRoute(
      settings: this,
      builder: (BuildContext context) => LoginProvider(child: LoginScreen()),
    );
  }
}

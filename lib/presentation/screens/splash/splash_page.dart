import 'package:athlon_task/presentation/screens/splash/splash_view.dart';
import 'package:athlon_task/shared/page_route_builder.dart';
import 'package:flutter/material.dart';

class SplashPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return SlideRightRoute(
      settings: this,
      builder: (BuildContext context) => LoadingScreen(),
    );
  }
}

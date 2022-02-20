import 'package:athlon_task/presentation/screens/profile/profile_provider.dart';
import 'package:athlon_task/presentation/screens/profile/profile_view.dart';
import 'package:athlon_task/shared/page_route_builder.dart';
import 'package:flutter/material.dart';

class SettingsPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return SlideRightRoute(
      settings: this,
      builder: (BuildContext context) =>
          SettingsProvider(child: SettingsScreen()),
    );
  }
}

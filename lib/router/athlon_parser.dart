import 'package:flutter/material.dart';
import 'pages.dart';

class AthlonParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    final path = '/' + uri.pathSegments[0];
    switch (path) {
      case PagePaths.Login:
        return Pages.Login.configuration;
      case PagePaths.Profile:
        return Pages.Settings.configuration;
      default:
        return Pages.Login.configuration;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    return RouteInformation(location: configuration.uiPage.path);
  }
}
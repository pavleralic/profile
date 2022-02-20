import 'package:athlon_task/presentation/screens/splash/splash_page.dart';
import 'package:athlon_task/presentation/screens/login/login_page.dart';
import 'package:athlon_task/presentation/screens/profile/profile_page.dart';
import 'package:athlon_task/state/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AthlonRouterDelegate extends RouterDelegate<Uri>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<Uri>,
        WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  List<Page> _getPages(BuildContext context) {
    final authModel = context.watch<AuthState>();
    final didLoadInitialData = authModel.didFetchInitialAuthData;
    final currentUser = authModel.currentUser;
    final isLoggedIn = authModel.isLoggedIn;
    if (!didLoadInitialData) { return [SplashPage()]; }
    else if (currentUser == null && !isLoggedIn && didLoadInitialData) { return [LoginPage()]; }
    else { return [SettingsPage()]; }
  }

  @override
  Future<void> setNewRoutePath(Uri uri) async {
    navigatorKey?.currentState
        ?.pushNamed(uri.path, arguments: uri.queryParameters);
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _getPages(context),
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}

import 'package:flutter/cupertino.dart';

enum Pages { Login, Settings }

enum PageState {
  none,
  addPage,
  addAll,
  addWidget,
  replaceWidget,
  pop,
  replace,
  replaceAll,
  replaceAllToRoutePage,
}

class PageAction {
  PageState state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction({this.state = PageState.none, this.page, this.pages, this.widget});
}

extension PagesExtension on Pages {
  PageConfiguration get configuration {
    switch (this) {
      case Pages.Login:
        return PageConfiguration(key: 'Login', path: this.path, uiPage: this);
      case Pages.Settings:
        return PageConfiguration(
            key: 'Settings', path: this.path, uiPage: this);
    }
  }

  String get path {
    switch (this) {
      case Pages.Login:
        return PagePaths.Login;
      case Pages.Settings:
        return PagePaths.Profile;
    }
  }
}

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction? currentPageAction;

  PageConfiguration(
      {required this.key,
      required this.path,
      required this.uiPage,
      this.currentPageAction});
}

abstract class PagePaths {
  static const String Login = '/login';
  static const String Profile = '/settings';
}

import 'package:flutter/cupertino.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;

  SlideRightRoute({required this.builder, RouteSettings? settings})
      : super(
            pageBuilder: (context, _, __) => builder(context),
            settings: settings,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}

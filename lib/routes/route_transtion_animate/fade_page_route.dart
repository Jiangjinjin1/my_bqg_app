import 'package:flutter/widgets.dart';

// 渐变过度
class FadePageRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;

  FadePageRoute({required this.builder})
      : super(
    pageBuilder: builder,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
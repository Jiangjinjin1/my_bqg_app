import 'package:flutter/widgets.dart';

// 缩放动画
class ScalePageRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;

  ScalePageRoute({required this.builder})
      : super(
    pageBuilder: builder,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
}
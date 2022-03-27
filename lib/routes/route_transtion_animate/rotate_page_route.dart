import 'package:flutter/material.dart';

// 右滑过度效果
class RotatePageRoute extends PageRouteBuilder<Widget> {
  final RoutePageBuilder builder;
  RotatePageRoute({required this.builder})
      : super(
    pageBuilder: builder,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        ),
  );
}
import 'package:flutter/material.dart';

// 右滑过度效果
class SlideRightRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;
  SlideRightRoute({required this.builder})
      : super(
    pageBuilder: builder,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
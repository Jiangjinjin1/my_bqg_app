
import 'package:flutter/material.dart';

// 左滑过度效果
class SlideLeftPageRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;
  SlideLeftPageRoute({required this.builder})
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
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
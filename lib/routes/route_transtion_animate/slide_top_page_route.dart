import 'package:flutter/material.dart';

// 向上过度效果
class SlideTopPageRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;
  SlideTopPageRoute({required this.builder})
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
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
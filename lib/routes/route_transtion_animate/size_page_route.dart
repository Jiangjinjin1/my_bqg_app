import 'package:flutter/material.dart';

// 大小过度效果
class SizePageRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;
  SizePageRoute({required this.builder})
      : super(
    pageBuilder: builder,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}
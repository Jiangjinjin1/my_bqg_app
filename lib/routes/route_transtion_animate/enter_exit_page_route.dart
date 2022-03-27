import 'package:flutter/material.dart';

/**
 * usage
 * Navigator.push(context,
    EnterExitRoute(exitPage: this, enterPage: Screen2()))
 */
// 左进右退过度效果
class EnterExitPageRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  final RoutePageBuilder builder;
  EnterExitPageRoute({required this.builder, required this.enterPage, required this.exitPage})
      : super(
    pageBuilder: builder,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(-1.0, 0.0),
              ).animate(animation),
              child: exitPage,
            ),
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: enterPage,
            )
          ],
        ),
  );
}
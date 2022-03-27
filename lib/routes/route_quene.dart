import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/pages/catalog/CatalogPage.dart';
import 'package:my_bqg_app/pages/home/home_page.dart';
import 'package:my_bqg_app/pages/reader/book_reader_page.dart';
import 'package:my_bqg_app/pages/transition/transition_page.dart';
import 'package:my_bqg_app/routes/route_transtion_animate/transiton_index.dart';

class RouteQueue {
  static final Map<String, dynamic> routes = {
    '/transition': (context, {arguments}) => TransitionPage(),
    '/': (context, {arguments}) => HomePage(arguments: arguments),
    '/book_reader_page': (context, {arguments}) => BookReaderPage(arguments: arguments),
    '/catalog': (context, {arguments}) => CatalogPage(arguments: arguments),
  };

  static final dynamic transitionMode = {
    'fade': (RoutePageBuilder builder) => FadePageRoute(builder: builder),
    'rotate': (RoutePageBuilder builder) => RotatePageRoute(builder: builder),
    'scale': (RoutePageBuilder builder) => ScalePageRoute(builder: builder),
    'scale_rotate': (RoutePageBuilder builder) => ScaleRotatePageRoute(builder: builder),
    'size': (RoutePageBuilder builder) => SizePageRoute(builder: builder),
    'slide_right': (RoutePageBuilder builder) => SlideRightRoute(builder: builder),
    'slide_top': (RoutePageBuilder builder) => SlideTopPageRoute(builder: builder),
    'slide_left': (RoutePageBuilder builder) => SlideLeftPageRoute(builder: builder),
    'normal': (WidgetBuilder builder) => CupertinoPageRoute(builder: builder),
  };
}
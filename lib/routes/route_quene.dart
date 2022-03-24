import 'package:my_bqg_app/pages/home/home_page.dart';
import 'package:my_bqg_app/pages/transition/transition_page.dart';

class RouteQueue {
  static final Map<String, dynamic> routes = {
    '/transition': (context, {arguments}) => TransitionPage(),
    '/': (context, {arguments}) => HomePage(arguments: arguments),
  };
}
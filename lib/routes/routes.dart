// 这里进行路由的配置
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/routes/route_quene.dart';

// 遇到的问题
// 1、 pageContentBuilder没有定义好类型导致报错
// 2、transitionPageRoute类型定义和实体类返回不匹配报错

typedef Widget PageFunction(context, {arguments});

// 这里的代码其实就是将onGenerateRoute抽离出来放到一个单独的文件并进行条件的判断
// 再将其中的函数放到一个Map进行分发
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  print('settings-----:${settings.name}-----:${settings.arguments}}');
  // 路由名称
  final String? name = settings.name;
  // 根据路由名称在routes中找到对应的路由
  final PageFunction pageContentBuilder = RouteQueue.routes[name] as PageFunction;
  final dynamic? arguments = settings.arguments;
  String transitionMode = arguments != null && arguments['mode'] != null ? arguments!['mode'] : 'normal';
  bool isNormalMode = transitionMode == 'normal';
  dynamic transitionPageRoute;
  try {
    transitionPageRoute = RouteQueue.transitionMode[transitionMode];
  } catch (e) {
    if (kDebugMode) {
      print('route.error----$e');
    }
  }

  // 如果路由不为null 即路由存在于routes中
  if (pageContentBuilder != null) {
    // 如果有接收到arguments
    if (settings.arguments != null) {
      return transitionPageRoute(isNormalMode ? (
          BuildContext context,
          ) {
        return pageContentBuilder(context, arguments: arguments);
      } : (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        return pageContentBuilder(context, arguments: arguments);
      });
    } else {
      return transitionPageRoute(isNormalMode ? (
          BuildContext context,
          ) {
        return pageContentBuilder(context, arguments: arguments);
      } : (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        return pageContentBuilder(context);
      });
    }
  } else {
    return transitionPageRoute(isNormalMode ? (
        BuildContext context,
        ) {
      return pageContentBuilder(context, arguments: arguments);
    } : (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) {
      return Scaffold(
        appBar: AppBar(
          title: Text("404 not found ! !"),
        ),
        body: Container(
          child: Text("路由不存在"),
        ),
      );
    });
  }
}

// 这里进行路由的配置
import 'package:flutter/material.dart';
import 'package:my_bqg_app/routes/route_quene.dart';

// 这里的代码其实就是将onGenerateRoute抽离出来放到一个单独的文件并进行条件的判断
// 再将其中的函数放到一个Map进行分发
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  print('settings-----:${settings.name}-----:${settings.arguments}}');
  // 路由名称
  final String? name = settings.name;
  // 根据路由名称在routes中找到对应的路由
  final Function pageContentBuilder = RouteQueue.routes[name] as Function;
  final arguments = settings.arguments;
  // 如果路由不为null 即路由存在于routes中
  if (pageContentBuilder != null) {
    // 如果有接收到arguments
    if (settings.arguments != null) {
      return MaterialPageRoute(builder: (context) {
        return pageContentBuilder(context, arguments: arguments);
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        return pageContentBuilder(context);
      });
    }
  } else {
    return MaterialPageRoute(builder: (context) {
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

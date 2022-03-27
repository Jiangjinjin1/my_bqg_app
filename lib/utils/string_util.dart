import 'dart:convert' as convert;

// 处理string相关的功能
class StringUtil {
  static handleStringJson(String data) {
    // 有些接口json字符串返回不规整，把多余逗号去除
    String stringJson = data.replaceAllMapped(RegExp(r'(,\])|(,})'), (Match m) => m[0]!.replaceAll(',', ''));
    return convert.jsonDecode(stringJson.toString());
  }
}
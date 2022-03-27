import 'package:my_bqg_app/public.dart';
import 'dart:convert' as convert;

class ApiRequest {

  // 获取书架列表
  static Future getBookShelfList() async {
    const String path = '${HostConfig.userxs_api_host}/Bookshelf.aspx';
    final response = await Http.get(
      path,
    );
    List<dynamic> data = response['data'];
    List<BookShelfItemModel> list = BookShelfList.fromJson(data).list;
    return list;
  }

  // 删除书架的书籍
  static Future removeBookShelfList(String bookIds) async {
    const String path = '${HostConfig.scxs_api_host}/BookAction.aspx';
    final response = await Http.post(
        path,
        params: {
          'action': 'removebookcase',
          'bookIds': bookIds,
        }
    );
    var data = response['data'];
    return data;

  }

  // 获取书籍详情
  static Future getBookDetails(int id) async {
    int tmId = int.parse(id.toString().substring(0, 3)) + 1;
    String path = '${HostConfig.infosxs_api_host}/BookFiles/Html/${tmId.toString()}/$id/info.html';
    final response = await Http.get(
      path,
    );
    dynamic data = response['data'];
    BookDetailModel result = BookDetailModel.fromJson(data);
    return result;
  }

  // 获取书籍详情
  static Future getBookCatalog(int id) async {
    int tmId = int.parse(id.toString().substring(0, 3)) + 1;
    String path = '${HostConfig.infosxs_api_host}/BookFiles/Html/${tmId.toString()}/$id/index.html';
    final response = await Http.get(
      path,
    );
    dynamic data = response['data'];
    BookCatalogModel result = BookCatalogModel.fromJson(data);
    return result;
  }


}
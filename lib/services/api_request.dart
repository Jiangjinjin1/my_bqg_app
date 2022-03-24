import 'package:my_bqg_app/models/book_shelf_item_model.dart';
import 'package:my_bqg_app/public.dart';

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


}
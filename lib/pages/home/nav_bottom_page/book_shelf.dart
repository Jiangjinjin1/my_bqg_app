import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_bqg_app/models/book_shelf_item_model.dart';
import 'package:my_bqg_app/pages/home/component/book_shelf_list.dart';
import 'package:my_bqg_app/pages/home/component/bootom_sheet_modal.dart';
import 'package:my_bqg_app/public.dart';
import 'package:my_bqg_app/services/api_request.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key}) : super(key: key);

  @override
  _BookShelfState createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectIndex = 0;
  List<BookShelfItemModel> _list = BookShelfList.fromJson([]).list;

  // 列表格式
  BookShelfLayout _listLayoutType = BookShelfLayout.tile;

  // 整理书架
  bool _showModifyModle = false;

  // 全选、取消全选
  bool _isAllSelect = false;

  // 选择的书籍
  List<BookShelfItemModel> _selectBookList = BookShelfList.fromJson([]).list;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );

    _tabController.addListener(() {
      setState(() {
        _selectIndex = _tabController.index;
      });
    });
    _getBookShelfList();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Future _getBookShelfList() async {
    EasyLoading.show(status: 'loading...');
    _list = [];
    _list = await ApiRequest.getBookShelfList();
    EasyLoading.dismiss();
    setState(() {});
  }

  _showMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context)?.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset(0, 50), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    String _layoutText =
        _listLayoutType == BookShelfLayout.tile ? '宫格模式' : '列表模式';

    showMenu(
      elevation: 15,
      context: context,
      position: position,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: Text('整理书架'),
          onTap: _finishingBookshelf,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text(_layoutText),
          onTap: _listLayout,
        ),
        PopupMenuDivider(),
        PopupMenuItem(child: Text('上传进度')),
        PopupMenuDivider(),
        PopupMenuItem(child: Text('下载进度')),
        PopupMenuDivider(),
        PopupMenuItem(child: Text('WI-FI传输')),
      ],
    );
  }

  // mark 整理书架
  _finishingBookshelf() {
    eventBus.emit(EventMessage.eventHideBottomNav, false);
    setState(() {
      _selectBookList = [];
      _showModifyModle = !_showModifyModle;
    });
  }

  // 列表布局
  _listLayout() {
    setState(() {
      _listLayoutType = BookShelfLayout.tile == _listLayoutType
          ? BookShelfLayout.grid
          : BookShelfLayout.tile;
    });
  }

  // 完成删除
  Future _finishDelete() async {
    eventBus.emit(EventMessage.eventHideBottomNav, true);
    setState(() {
      _showModifyModle = !_showModifyModle;
    });
  }

  // 全选、取消全选书籍
  _selectALlBook() {
    setState(() {
      _isAllSelect = !_isAllSelect;
      _selectBookList = _isAllSelect ? _list : [];
    });
  }

  // 删除选中书籍
  _deleteSelectBooks() {
    showCupertinoDialog(
        context: context,
        // barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('提示'),
            content: Text('确认删除吗？'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop('cancel');
                },
              ),
              CupertinoDialogAction(
                child: Text('确认'),
                onPressed: () async {
                  List<dynamic> tmpList = _selectBookList
                      .map((BookShelfItemModel item) => item.Id)
                      .toList();
                  await _deleteBook(tmpList.join(','));
                  Navigator.of(context).pop('ok');
                },
              ),
            ],
          );
        });
  }

  // 删除书籍
  Future _deleteBook(String bookIds) async {
    if (bookIds.isNotEmpty) {
      print('bookIds---$bookIds');
      dynamic result =
      await ApiRequest.removeBookShelfList(bookIds);
      print('result---$result');
      if (result['result'] == '2') {
        await _getBookShelfList();
      }
    }
  }

  // 选择书籍的回调
  _selectListCallback(BookShelfItemModel item) {
    if (_selectBookList.contains(item)) {
      _selectBookList.remove(item);
    } else {
      _selectBookList.add(item);
    }
    this.setState(() {});
  }

  // 长按书籍
  _selectBookLongTap(BookShelfItemModel item) {
    showCupertinoModalPopup(
      context: context,
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 6.0),
      builder: (context) {
        return BottomSheetModal(bookItem: item, deleteBookCallback: _deleteBook,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_showModifyModle ? '选择删除' : ''),
          centerTitle: true,
          backgroundColor: ColorUtil.string2Color('#1DADF2'),
          leadingWidth: 150,
          leading: _leadding(),
          actions: _actions()),
      body: TabBarView(
        controller: _tabController,
        children: [
          BookShelfListView(
            bookShelfList: _list,
            bookShelfLayout: _listLayoutType,
            showModifyModle: _showModifyModle,
            selectListCallback: _selectListCallback,
            selectBookList: _selectBookList,
            selectBookLongTap: _selectBookLongTap,
          ),
          Center(
            child: Text('漫画'),
          ),
        ],
      ),
      bottomNavigationBar: _showModifyModle
          ? SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          width: 0.5,
                          color: ColorUtil.string2Color('#cecece'))),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: _selectALlBook,
                        child: Text(
                          !_isAllSelect ? '全选' : '取消全选',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 1,
                      height: 58,
                      child: Container(
                        color: ColorUtil.string2Color('#cecece'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: _deleteSelectBooks,
                        child: const Text(
                          '确认删除',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  Widget _leadding() {
    return !_showModifyModle
        ? TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: EdgeInsets.all(0),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color:
                          _selectIndex == 0 ? Colors.white : Colors.transparent,
                      child: const Text('小说',
                          style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color:
                          _selectIndex == 1 ? Colors.white : Colors.transparent,
                      child: const Text('漫画',
                          style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }

  List<Widget> _actions() {
    return !_showModifyModle
        ? [
            Builder(builder: (BuildContext context) {
              return IconButton(onPressed: () {}, icon: Icon(Icons.search));
            }),
            Builder(builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    _showMenu(context);
                  },
                  icon: Icon(Icons.more_horiz));
            }),
          ]
        : [
            TextButton(
              onPressed: _finishDelete,
              child: const Text('完成',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ];
  }
}

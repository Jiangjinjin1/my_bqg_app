import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:my_bqg_app/components/scroll_bar_view.dart';
import 'package:my_bqg_app/public.dart';

class CatalogPage extends StatefulWidget {
  final dynamic arguments;

  const CatalogPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 1);
  double _alignmentY = -1.0;
  double _scrollMaxY = 1000.0;
  double _scrollTop = 0;
  bool _isTop = true;

  BookCatalogModel? _catalogData;
  List<BookCatalogGroupItemModel>? _catalogDataList;

  @override
  initState() {
    super.initState();
    _getCatalogData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  
  // 获取目录数据
  Future _getCatalogData() async {
    EasyLoading.show(status: 'loading...');
    _catalogData = await ApiRequest.getBookCatalog(widget.arguments['booId']);
    _catalogDataList = BookCatalogGroupListModel.fromModel(_catalogData!).list;
    setState(() {
      EasyLoading.dismiss();
    });
  }
  
  
  // 监听滚动
  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    setState(() {
      _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    });
    _scrollTop = metrics.pixels;
    _scrollMaxY = metrics.maxScrollExtent;
    return true;
  }

  // 滚动条到底部或底部
  _scrollLocation() {
    setState(() {
      _isTop = !_isTop;
      _scrollController.animateTo(_isTop ? 0 : _scrollMaxY, duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  // 拖动右侧滑块
  _onVerticalDragUpdate(DragUpdateDetails v) {
    _scrollTop += v.delta.dy;
    setState(() {
      _alignmentY = -1 + (_scrollTop / _scrollMaxY) * 2;
      _scrollController.animateTo(_scrollTop, duration: Duration(milliseconds: 1), curve: Curves.ease);
    });
  }

  // 看书
  _toLooBook() {
    // todo 看书
  }


  @override
  Widget build(BuildContext context) {
    if (_catalogData == null) return Scaffold();
    return Scaffold(
      appBar: AppBar(
        title: Text(_catalogData!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: ColorUtil.string2Color('#4F4F4F'))),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black54,
            size: 40,
          ),
        ),
        actions: [
          InkWell(
            onTap: _scrollLocation,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/bqg_imgs/2.0x/EImage_icon83.png',
                width: 32,
                height: 32,
              ),
            ),
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              _listView(),
              GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                child: ScrollBarView(
                  alignmentY: _alignmentY,
                )
              )
            ],
          )),
    );
  }

  Widget _listView() {
    return GroupedListView<dynamic, String>(
      controller: _scrollController,
      elements: _catalogDataList!,
      groupBy: (dynamic element) => element.group!,
      groupSeparatorBuilder: (String groupByValue) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(groupByValue, style: TextStyle(color: ColorUtil.string2Color('#575757'), fontSize: 12)),
      ),
      // useStickyGroupSeparators: true,
      floatingHeader: true,
      itemBuilder: (BuildContext context, dynamic element) => InkWell(
        onTap: _toLooBook,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(element.name!, style: TextStyle(color: ColorUtil.string2Color('#595959'), fontSize: 15, fontWeight: FontWeight.w500)),
        )
      )
    );
  }

}

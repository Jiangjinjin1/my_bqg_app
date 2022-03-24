import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/models/book_shelf_item_model.dart';
import 'package:my_bqg_app/pages/home/component/book_grid_view.dart';
import 'package:my_bqg_app/pages/home/component/book_tile_view.dart';
import 'package:my_bqg_app/public.dart';

class BookShelfListView extends StatefulWidget {
  final List<BookShelfItemModel> bookShelfList;
  final BookShelfLayout bookShelfLayout;
  final bool showModifyModle;
  final Function selectListCallback;
  final Function selectBookLongTap;
  final List<BookShelfItemModel> selectBookList;

  BookShelfListView(
      {Key? key,
      required this.bookShelfList,
      required this.bookShelfLayout,
      required this.showModifyModle,
      required this.selectListCallback,
      required this.selectBookList,
      required this.selectBookLongTap})
      : super(key: key);

  @override
  _BookShelfListViewState createState() => _BookShelfListViewState();
}

class _BookShelfListViewState extends State<BookShelfListView> {
  final ScrollController _scrollController = ScrollController();

  _selectBookCallback(BookShelfItemModel item) {
    widget.selectListCallback(item);
  }

  _selectBookLongTap(BookShelfItemModel item) {
    widget.selectBookLongTap(item);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bookShelfLayout == BookShelfLayout.tile) {
      return _listLayoutView();
    }
    return _gridLayoutView();
  }

  Widget _listLayoutView() {
    return ListView.builder(
        itemCount: widget.bookShelfList.length,
        itemBuilder: (context, index) {
          return BookTileView(
            index: index,
            bookItem: widget.bookShelfList[index],
            showModifyModle: widget.showModifyModle,
            selectBookList: widget.selectBookList,
            selectBookCallback: _selectBookCallback,
            selectBookLongTap: _selectBookLongTap,
          );
        });
  }

  Widget _gridLayoutView() {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridItemView(
          index: index,
          bookItem: widget.bookShelfList[index],
          showModifyModle: widget.showModifyModle,
          selectBookList: widget.selectBookList,
          selectBookCallback: _selectBookCallback,
          // selectBookList: _list,
        );
      },
      itemCount: widget.bookShelfList.length,
    );
  }
}

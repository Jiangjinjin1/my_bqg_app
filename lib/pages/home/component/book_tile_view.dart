import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/models/book_shelf_item_model.dart';
import 'package:my_bqg_app/public.dart';

class BookTileView extends StatelessWidget {
  final int index;
  final BookShelfItemModel bookItem;
  final bool showModifyModle;
  final Function selectBookCallback;
  final Function selectBookLongTap;
  final List<BookShelfItemModel> selectBookList;

  const BookTileView(
      {Key? key,
      required this.bookItem,
      required this.index,
      required this.showModifyModle,
      required this.selectBookCallback,
      required this.selectBookList,
      required this.selectBookLongTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: InkWell(
          onLongPress: () {
            selectBookLongTap(bookItem);
          },
          onTap: () {
            selectBookCallback(bookItem);
          },
          child: Container(
            height: 120,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: CachedNetworkImageProvider(
                      HostConfig.getImagePath(bookItem.Img)),
                  fit: BoxFit.cover,
                  width: 80,
                  height: 110,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bookItem.Name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorUtil.string2Color('#5A5A5A'))),
                        Text(bookItem.UpdateTime,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorUtil.string2Color('#929499'))),
                        Text(bookItem.LastChapter,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorUtil.string2Color('#5A5A5A'))),
                      ],
                    ),
                  ),
                ),
                showModifyModle
                    ? SizedBox(
                        width: 30,
                        height: 130,
                        child: Image.asset(
                          selectBookList.contains(bookItem)
                              ? 'assets/images/bqg_imgs/2.0x/EImage_icon47.png'
                              : 'assets/images/bqg_imgs/2.0x/EImage_icon48.png',
                          width: 21,
                          height: 21,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ));
  }
}

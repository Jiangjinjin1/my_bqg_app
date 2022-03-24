import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/models/book_shelf_item_model.dart';
import 'package:my_bqg_app/public.dart';

class GridItemView extends StatelessWidget {
  final int index;
  final BookShelfItemModel bookItem;
  final bool showModifyModle;
  final Function selectBookCallback;
  final List<BookShelfItemModel> selectBookList;

  const GridItemView({Key? key, required this.index, required this.bookItem, required this.showModifyModle, required this.selectBookCallback, required this.selectBookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          selectBookCallback(bookItem);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                AspectRatio(
                    aspectRatio: 1 / 1.3,
                    child: Image(
                      image: CachedNetworkImageProvider(HostConfig.getImagePath(bookItem.Img)),
                      fit: BoxFit.cover,
                    )
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    bookItem.Name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: ColorUtil.string2Color('#595959')),
                  ),
                )
              ],
            ),
            Center(
              child: showModifyModle ? SizedBox(
                width: 30,
                height: 130,
                child: Image.asset(
                  selectBookList.contains(bookItem) ? 'assets/images/bqg_imgs/2.0x/EImage_icon47.png' : 'assets/images/bqg_imgs/2.0x/EImage_icon48.png',
                  width: 21,
                  height: 21,
                ),
              ) : SizedBox.shrink(),
            )
          ],
        )
      )
    );
  }
}
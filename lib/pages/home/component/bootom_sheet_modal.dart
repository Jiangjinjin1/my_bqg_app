import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/models/book_shelf_item_model.dart';
import 'package:my_bqg_app/public.dart';

typedef MapString<T> = Map<T, T>;

final List<MapString<String>> _list = [
  {
    'key': 'toTop',
    'label': '置顶',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon154.png',
  },
  {
    'key': 'delete',
    'label': '删除',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon148.png',
  },
  {
    'key': 'group',
    'label': '分组',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon151.png',
  },
  {
    'key': 'catalog',
    'label': '目录',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon149.png',
  },
  {
    'key': 'share',
    'label': '分享',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon153.png',
  },
  {
    'key': 'detail',
    'label': '详情',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon149.png',
  },
  {
    'key': 'download',
    'label': '下载',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon149.png',
  },
  {
    'key': 'remove',
    'label': '清除',
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon148.png',
  },
];

class BottomSheetModal extends StatelessWidget {
  final BookShelfItemModel bookItem;
  final Function deleteBookCallback;

  const BottomSheetModal(
      {Key? key, required this.bookItem, required this.deleteBookCallback})
      : super(key: key);

  // 操作按钮
  _operateTap(context, MapString<String> item) {
    switch (item['key']) {
      case 'toTop':
        break;
      case 'delete':
        _deleteBook(context, item);
        break;
      case 'group':
        break;
      case 'catalog':
        break;
      case 'share':
        break;
      case 'detail':
        break;
      case 'download':
        break;
      case 'remove':
        break;
      default:
        break;
    }
  }

  // 删除操作
  _deleteBook(context, MapString<String> item) {
    Navigator.of(context).pop('cancel');
    showCupertinoDialog(
        context: context,
        // barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('提示'),
            content: Text('确认删除<${bookItem.Name}>?'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop('cancel');
                },
              ),
              CupertinoDialogAction(
                child: Text('确认'),
                onPressed: () {
                  deleteBookCallback(bookItem.Id.toString());
                  Navigator.of(context).pop('ok');
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      child: Column(
        children: [
          _bookItemView(),
          _operateView(context),
          _cancelButton(context),
        ],
      ),
    );
  }

  // 取消按钮
  Widget _cancelButton(context) {
    return MaterialButton(
        minWidth: Screen.width,
        onPressed: () {
          Navigator.of(context).pop('cancel');
        },
        child: const Text(
          '取消',
          style: TextStyle(color: ColorUtil.primary),
        ));
  }

  Widget _bookItemView() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: 0.5, color: ColorUtil.string2Color('#cecece'))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 95,
      child: Row(
        children: [
          Image(
            image: CachedNetworkImageProvider(
                HostConfig.getImagePath(bookItem.Img)),
            fit: BoxFit.cover,
            width: 60,
            height: 75,
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
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
                  Text(bookItem.Author,
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
        ],
      ),
    );
  }

  Widget _operateView(context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: ColorUtil.string2Color('#cecece')))),
        child: Wrap(
          children: _list
              .map((MapString<String> item) => _textButtonView(context, item))
              .toList(),
        ));
  }

  Widget _textButtonView(context, MapString<String> item) {
    return Container(
        width: Screen.width / 4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () {
            _operateTap(context, item);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                item['image']!,
                fit: BoxFit.cover,
                width: 25,
              ),
              Text(item['label']!),
            ],
          ),
        ));
  }
}

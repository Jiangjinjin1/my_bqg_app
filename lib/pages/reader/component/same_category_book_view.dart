import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/public.dart';

class SameCategoryBookView extends StatefulWidget {
  final BookDetailModel bookDetail;

  const SameCategoryBookView({Key? key, required this.bookDetail})
      : super(key: key);

  @override
  _SameCategoryBookViewState createState() => _SameCategoryBookViewState();
}

class _SameCategoryBookViewState extends State<SameCategoryBookView> {
  final ScrollController _scrollController = ScrollController();
  int start = 0;
  int end = 6;
  late List<SameCategoryBookModel> _list;

  @override
  void initState() {
    super.initState();
    _list = widget.bookDetail.SameCategoryBooks.sublist(start, end < widget.bookDetail.SameCategoryBooks.length ? end : widget.bookDetail.SameCategoryBooks.length);
  }

  _changeNext() {
    start = end == widget.bookDetail.SameCategoryBooks.length ? 0 : end;
    if (end + 6 <= widget.bookDetail.SameCategoryBooks.length) {
      end = end + 6;
    } else if (end + 6 > widget.bookDetail.SameCategoryBooks.length && end < widget.bookDetail.SameCategoryBooks.length) {
      end = widget.bookDetail.SameCategoryBooks.length;
    } else {
      end = 6;
    }
    _list = widget.bookDetail.SameCategoryBooks.sublist(start, end);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('类似书籍',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: _changeNext,
                  child: Text(
                    '换一批',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  )),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 280),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: _gridBookList(),
          )
        ],
      ),
    );
  }

  Widget _gridBookList() {
    return GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Image(
                    image: CachedNetworkImageProvider(
                        HostConfig.getImagePath(_list[index].Img)),
                    fit: BoxFit.cover,
                    width: 75,
                    height: 90,
                  ),
                  SizedBox(height: 8),
                  Text(_list[index].Name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, color: Colors.black54))
                ],
              ),
            )
          );
        });
  }
}

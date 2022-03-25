import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/public.dart';

class BookReaderHeader extends StatelessWidget {
  final BookDetailModel bookDetail;

  const BookReaderHeader({Key? key, required this.bookDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      color: ColorUtil.string2Color('#5B777E'),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: CachedNetworkImageProvider(
                    HostConfig.getImagePath(bookDetail.Img)),
                fit: BoxFit.cover,
                width: 65,
                height: 80,
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
                      Text(bookDetail.Name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorUtil.string2Color('#ffffff'))),
                      SizedBox(height: 8),
                      Text(bookDetail.Author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorUtil.string2Color('#ffffff'))),
                      SizedBox(height: 8),
                      Text(
                          '${bookDetail.CName} / ${bookDetail.BookStatus}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorUtil.string2Color('#ffffff'))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ...List.generate(5, (int index) => index).map((item) {
                    return Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Image.asset(
                          getVoteScore(item, bookDetail.BookVote.Score),
                          fit: BoxFit.cover,
                          width: 15),
                    );
                  }).toList(),
                  SizedBox(width: 5),
                  Text(bookDetail.BookVote.Score.toString(), style: TextStyle(color: ColorUtil.string2Color('#F3C43E'), fontSize: 15, fontWeight: FontWeight.bold),),
                ],
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '+ 加收藏',
                    style: TextStyle(fontSize: 14, color: ColorUtil.string2Color('#707070'), fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

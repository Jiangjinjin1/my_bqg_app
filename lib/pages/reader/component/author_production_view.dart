import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_bqg_app/public.dart';

class AuthorProductionView extends StatelessWidget {
  final BookDetailModel bookDetail;

  const AuthorProductionView({Key? key, required this.bookDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('作者还写过',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5),
          Container(
            constraints: BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: _authorProduction(),
          )
        ],
      ),
    );
  }

  Widget _authorProduction() {
    final List<SameUserBookModel> threeProduction =
        bookDetail.SameUserBooks.sublist(0, 3 < bookDetail.SameUserBooks.length ? 3 : bookDetail.SameUserBooks.length);
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: threeProduction.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: CachedNetworkImageProvider(
                          HostConfig.getImagePath(threeProduction[index].Img)),
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
                            Text(threeProduction[index].Name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorUtil.string2Color('#5D5D5D'),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  color: ColorUtil.string2Color('#C9C9C9'),
                                ),
                                SizedBox(width: 4),
                                Text(threeProduction[index].Author,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            ColorUtil.string2Color('#5C5C5C'))),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text('${threeProduction[index].LastChapter}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorUtil.string2Color('#959595'))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

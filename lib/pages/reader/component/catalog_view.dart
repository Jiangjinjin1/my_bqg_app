import 'package:flutter/material.dart';
import 'package:my_bqg_app/public.dart';

class CatalogView extends StatelessWidget {
  final BookDetailModel bookDetail;
  const CatalogView({Key? key, required this.bookDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('目录', style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold)),
              Text(bookDetail.LastTime, style: TextStyle(color: Colors.black45, fontSize: 16)),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(bookDetail.LastChapter, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right, color: Colors.grey))
              ],
            ),
          )
        ],
      ),
    );
  }
}

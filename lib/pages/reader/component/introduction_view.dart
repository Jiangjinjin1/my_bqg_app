import 'package:flutter/material.dart';
import 'package:my_bqg_app/public.dart';

class IntroductionView extends StatelessWidget {
  final BookDetailModel bookDetail;
  const IntroductionView({Key? key, required this.bookDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('简介', style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Text(bookDetail.Desc, style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}

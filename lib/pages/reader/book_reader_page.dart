import 'package:flutter/material.dart';
import 'package:my_bqg_app/pages/reader/component/author_production_view.dart';
import 'package:my_bqg_app/pages/reader/component/book_reader_header.dart';
import 'package:my_bqg_app/pages/reader/component/catalog_view.dart';
import 'package:my_bqg_app/pages/reader/component/introduction_view.dart';
import 'package:my_bqg_app/pages/reader/component/same_category_book_view.dart';
import 'package:my_bqg_app/pages/reader/component/text_icon.dart';
import 'package:my_bqg_app/public.dart';

final List<Map<String, String>> bottomList = [
  {
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon54.png',
    'label': '推荐',
    'key': 'recommend',
  },
  {
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon55.png',
    'label': '分享',
    'key': 'share',
  },
  {
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon94.png',
    'label': '推荐',
    'key': 'cache',
  },
  {
    'image': 'assets/images/bqg_imgs/2.0x/EImage_icon127.png',
    'label': '推荐',
    'key': 'error',
  },
];

class BookReaderPage extends StatefulWidget {
  final Map? arguments;
  const BookReaderPage({Key? key, this.arguments}) : super(key: key);

  @override
  _BookReaderPageState createState() => _BookReaderPageState();
}

class _BookReaderPageState extends State<BookReaderPage> {
 BookDetailModel? _bookDetailData;

  @override
  void initState() {
    super.initState();
    _getBookData();
  }

  Future _getBookData() async {
    EasyLoading.show(status: 'loading...');
    _bookDetailData = await ApiRequest.getBookDetails(widget.arguments!['Id']);
    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_bookDetailData == null) {
      return Scaffold();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('书籍详情'),
        backgroundColor: ColorUtil.string2Color('#5B777E'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              BookReaderHeader(bookDetail: _bookDetailData!,),
              IntroductionView(bookDetail: _bookDetailData!,),
              CatalogView(bookDetail: _bookDetailData!,),
              AuthorProductionView(bookDetail: _bookDetailData!,),
              SameCategoryBookView(bookDetail: _bookDetailData!,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxHeight: 58),
          padding: EdgeInsets.only(right: 15 ),
          child: Row(
            children: [
              ...bottomList.map((dynamic item) => TextIconView(title: item['label'], image: item['image'])).toList(),
              Expanded(flex: 1, child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: RawMaterialButton(
                  fillColor: ColorUtil.primary,
                  textStyle: TextStyle(fontSize: 15, color: Colors.white),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('开始阅读'),
                  onPressed: () {},
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get mounted => super.mounted;

}

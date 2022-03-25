import 'package:flutter/material.dart';

class TextIconView extends StatelessWidget {
  final String title;
  final String image;
  const TextIconView({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(children: [
        Image.asset(image, fit: BoxFit.cover, width: 25,),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.black54),),
      ]),
    );
  }
}

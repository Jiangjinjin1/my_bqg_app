import 'package:flutter/material.dart';
import 'package:my_bqg_app/public.dart';

class ScrollBarView extends StatelessWidget {
  final double alignmentY;
  const ScrollBarView({Key? key, required this.alignmentY}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1, alignmentY),
      width: 20,
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: ColorUtil.primary),
        width: 20,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.arrow_drop_up,
              size: 18,
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

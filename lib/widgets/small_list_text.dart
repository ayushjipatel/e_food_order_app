import 'package:flutter/cupertino.dart';

class Small_List_Text extends StatelessWidget {
  Color? color;
  final String text;
  TextOverflow overflow;
  double size;
  double height;
  Small_List_Text({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        overflow: overflow,
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? 12 : size,
        height: height,
      ),
    );
  }
}

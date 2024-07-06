import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? data;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  const AppText( 
      {super.key ,required this.data, this.fontWeight, this.color, this.size,});

  @override
  Widget build(BuildContext context) {
    return Text(
      data.toString(),
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }
}

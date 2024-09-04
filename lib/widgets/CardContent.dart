import 'dart:math';

import 'package:flutter/material.dart';


class CardContent {
    CardContent( {required this.content, required this.color,this.isBackSide});
  final String content;
  final Color color;
  bool? isBackSide;

  contentWidget(BuildContext context) {
    return Transform.flip(
      flipX: isBackSide ?? false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width:400,
        decoration: BoxDecoration(
          color: color
        ),
        child: Center(child: Text(content)),
      ),
    );
  }
}
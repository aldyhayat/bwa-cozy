import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {

  final int ? index;
  final int ? rating;

  RatingItem({this.index,this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index !<= rating! ? 'assets/images/vector 382.png' : 'assets/images/vector 383.png',
      width: 20,
      );
  }
}
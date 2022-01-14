import 'package:flutter/material.dart';
import 'package:bootcamp_buildangga/color.dart';
class FacilityItem extends StatelessWidget {

  final String ? name;
  final String ? imgUrl;
  final int ? total;

  FacilityItem({this.name,this.imgUrl,this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imgUrl.toString(), width: 32,),
        SizedBox(height: 14,),
        Text.rich(
        TextSpan(
        text: '${total}',
        style: TextStyle(fontSize: 16,color: buttonColor,),
        children: [
        TextSpan(text: ' ${name}',style: TextStyle(fontSize: 14, color: textGrayColor, ) ),
        ])
        ),

      ],
    );
  }
}
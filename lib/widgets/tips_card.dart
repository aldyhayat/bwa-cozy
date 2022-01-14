import 'package:bootcamp_buildangga/models/tips.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_buildangga/color.dart';
import 'package:bootcamp_buildangga/models/tips.dart';
class TipsCard extends StatelessWidget {

  final Tips  tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 80,
            color: backgroundColor,
            child: Stack(children: [
              Image.asset(tips.imageUrl.toString(), width: 80,),
         ],),
          ),
        ),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${tips.title}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),
             SizedBox(height: 4,),
            Text('${tips.updateAt}', style: TextStyle(color: textGrayColor, fontSize: 14, fontWeight: FontWeight.w300),),
           
          ],
        ),
         Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right, color: textGrayColor,))
      ],
    );
  }
}
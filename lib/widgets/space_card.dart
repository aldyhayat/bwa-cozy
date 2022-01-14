import 'package:bootcamp_buildangga/models/space.dart';
import 'package:bootcamp_buildangga/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:bootcamp_buildangga/color.dart';
import 'package:bootcamp_buildangga/models/space.dart';
class SpaceCard extends StatelessWidget {

  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(space: space,)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 130,
              child: Stack(children: [
                Image.network(
                  space.imageUrl.toString(),
                  width: 130,
                  height: 110,
                  fit: BoxFit.cover,
                  ),
                Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                          )
                        ),
                        child: Center(child:
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image.asset('assets/images/Vector 388.png', width: 18,),
                             Text('${space.rating}/5', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),),
                           ],
                         ) )
                    
                      ),
                    ) 
              ],),
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(space.name.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),
              SizedBox(height: 2,),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: TextStyle(
                    fontSize: 16,
                    color: buttonColor,
                  ),
                  children: [
                  TextSpan(text: ' / month',style: TextStyle(fontSize: 16, color: textGrayColor, ) ),
                  ]
                  )
              ),
              SizedBox(height: 16,),
              Text('${space.city}, ${space.country}}', style: TextStyle(color: textGrayColor, fontSize: 14, fontWeight: FontWeight.w300),),
            ],
          )
    
        ],
      ),
    );
  }
}
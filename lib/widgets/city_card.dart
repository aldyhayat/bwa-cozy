import 'package:bootcamp_buildangga/color.dart';
import 'package:bootcamp_buildangga/models/city.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {

  final City city;
  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: cardColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(city.imageUrl.toString(), height: 102, width: 120,fit: BoxFit.cover,),
                city.isPopular! ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                      )
                    ),
                    child: Center(child: Image.asset('assets/images/Vector 388.png', width: 18,) )
                
                  ),
                ) : Container(),
              ],
            ),

            SizedBox(height: 11,),
            Text(city.name.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
          ],),
    
      ),
    );
  }
}
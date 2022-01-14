import 'package:bootcamp_buildangga/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(alignment: Alignment.bottomCenter, child: Image.asset('assets/images/bottom.png')),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo.png'))),
                  ),
                  SizedBox(height: 30,),
                  Text('Find Cozy House\nto Stay and Happy', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Text('Stop membuang banyak waktu pada\ntempat yang tidak habitable', style: TextStyle(color: textGrayColor, fontSize: 16, fontWeight: FontWeight.w300 ),),
                  SizedBox(height: 40,),
                  Container(
                    height: 50,
                    width: 210,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                      child: 
                      Text('Explore Now', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),),
                      color: buttonColor,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
                      },
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
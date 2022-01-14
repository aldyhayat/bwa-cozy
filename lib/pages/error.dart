import 'package:bootcamp_buildangga/color.dart';
import 'package:bootcamp_buildangga/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/404.png', width: 300,),
              SizedBox(height: 70,),
              Text('Where are you going?', style: TextStyle(fontSize: 24, fontWeight:FontWeight.w500, color: Colors.black,)),
              SizedBox(height: 14,),
              Text('Seems like the page that you were\n requested is already gone', style: TextStyle(fontSize: 16, fontWeight:FontWeight.w300, color: textGrayColor,), textAlign: TextAlign.center,),
              SizedBox(height: 50,),
              Container(
                width: 210,
                height: 50,
                child: RaisedButton(
                  color: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text('Back to Home', style: TextStyle(
                    fontSize: 18, 
                    color: Colors.white),),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                  },
                ),
              )

            ],
          ),
        ),

      ),
      backgroundColor: Colors.white,
    );
  }
}
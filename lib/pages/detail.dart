import 'package:bootcamp_buildangga/color.dart';
import 'package:bootcamp_buildangga/models/space.dart';
import 'package:bootcamp_buildangga/widgets/facilitiy_item.dart';
import 'package:bootcamp_buildangga/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'error.dart';

class DetailPage extends StatelessWidget {

  final Space ? space;
  DetailPage({this.space});
  
  @override
  Widget build(BuildContext context) {
    launch(String url) async{
      if(await canLaunch(url)){
        launch(url);
      }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorPage()));
    
      }
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(space!.imageUrl.toString(),
             width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,),
             ListView(
                children: [
                  SizedBox(height: 328,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        // NOTE: TITLE
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [  
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${space?.name}', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                                  SizedBox(height: 2,),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$${space?.price}',
                                      style: TextStyle(fontSize: 16,color: buttonColor,),
                                      children: [
                                        TextSpan(text: ' / month',style: TextStyle(fontSize: 16, color: textGrayColor, ) ),
                                        ])
                                        ),
                           
                                ],
                              ),
                              Row(
                                children: [1,2,3,4,5].map((index){
                                 return Container(
                                    margin: EdgeInsets.only(left:2 ),
                                    child: RatingItem(
                                      index: index,
                                      rating: space?.rating,
                                      ),
                                  );
                                }).toList(),)
                           ],),
                          ),
                          SizedBox(height: 30,),
                          // Note MAIN FACILITIES
                          Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Main Facilities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                        ), 
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: 'kichen',
                                imgUrl: 'assets/images/counter.png',
                                total: space?.numberOfKitchens,
                              ),
                              FacilityItem(
                                name: 'bedroom',
                                imgUrl: 'assets/images/double.png',
                                total: space?.numberOfBedrooms,
                              ),
                              FacilityItem(
                                name: 'Big Lemari',
                                imgUrl: 'assets/images/Group.png',
                                total: space?.numberOfCupboards,
                              ),
                            ],
                          )
                          ),
                          SizedBox(height: 30,),
                          // Note Photo
                          Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Photos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          height: 110,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space!.photos!.map((item){
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()
                          )),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  // Note Location
                  Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
                        ),
                  SizedBox(height: 6,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: edge
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${space?.address}\n${space?.city}', style: TextStyle(color: textGrayColor),),
                        InkWell(
                          onTap: (){
                            launch(space!.mapUrl.toString());
                          },
                          child: Image.asset('assets/images/location.png', width: 22,)),
                      ],
                    ),
                  ),
                  SizedBox(height:40),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: edge
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width - (2 * edge),
                    child: RaisedButton(
                      onPressed: (){
                        launch('tel://${space?.phone}');
                      },
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Text('Book Now', style: TextStyle(color: Colors.white, fontSize: 18),),),
                  ),
                   SizedBox(height: 40,),
                ],
              )
            ,  Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/btn_back.png',
                      width: 40,
                      ),
                    ),
                    Image.asset('assets/images/btn_wishlist.png',
                    width: 40,
                    ),
                  ],
                ),
              ),
             
          ],)
        ,),
    );
  }
}
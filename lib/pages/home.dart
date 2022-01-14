import 'package:bootcamp_buildangga/color.dart';
import 'package:bootcamp_buildangga/models/city.dart';
import 'package:bootcamp_buildangga/models/space.dart';
import 'package:bootcamp_buildangga/providers/space_provider.dart';
import 'package:bootcamp_buildangga/widgets/bottom_navbar.dart';
import 'package:bootcamp_buildangga/widgets/city_card.dart';
import 'package:bootcamp_buildangga/widgets/space_card.dart';
import 'package:bootcamp_buildangga/widgets/tips_card.dart';
import 'package:bootcamp_buildangga/models/tips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var spaceProvider = Provider.of<SpaceProvider>(context);
    

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [   
            SizedBox(height: edge,),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text("Explore Now", style: TextStyle(color: Colors.black, fontSize: edge, fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Mencari kosan yang cozy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: textGrayColor),),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Popular Cities', style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 16,),
              Container(
                height:150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 24,),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/images/image10.png'
                      )
                    ),
                    SizedBox(width: 20,),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Bandung',
                        imageUrl: 'assets/images/pic.png',
                        isPopular: true,
                      )
                    ),
                    SizedBox(width: 20,),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Surabaya',
                        imageUrl: 'assets/images/pic (1).png'
                      )
                    ),
                    SizedBox(width: 24,),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Recommended Space', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: 
                FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){

                      List<Space>? data = snapshot.data as List<Space>?;

                      int index = 0;


                      return   Column(
                  children: data!.map((item){
                     {
                    index++;
                    return Container(
                      margin: EdgeInsets.only(
                        top: index == 1 ? 0 : 30,
                      ),
                      child: SpaceCard(item),
                    );
                  }
                  }).toList(),
                );
              
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text('Tips & Guidance', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title : 'City GuideLines',
                      imageUrl: 'assets/images/Group 7.png',
                      updateAt:'20 Apr',
                    )
                  ),
                  SizedBox(height: 20,),
                  TipsCard(
                    Tips(
                      id: 2,
                      title : 'Jakarta Fairship',
                      imageUrl: 'assets/images/icon.png',
                      updateAt:'11 Dec',
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 50 *edge),
     ],
        )
          ),
          floatingActionButton:          Container(
                height: 65,
                width: MediaQuery.of(context).size.width - (2 * edge),
                margin: EdgeInsets.symmetric(horizontal: edge),
                decoration: BoxDecoration(
                  color: buttonHomeColor,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavbarItem(
                      imageUrl: 'assets/images/Subtract.png',
                      isActive: true,
                    ),
                    BottomNavbarItem(
                      imageUrl: 'assets/images/Icon_mail_solid.png',
                      isActive: false,
                    ),
                    BottomNavbarItem(
                      imageUrl: 'assets/images/Icon_card_solid.png',
                      isActive: false,
                    ),
                    BottomNavbarItem(
                      imageUrl: 'assets/images/Union.png',
                      isActive: false,
                    ),
                  ],),
              ),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
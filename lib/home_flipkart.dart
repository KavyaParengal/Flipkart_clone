

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipkart_clone/home_grocery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Home_page_flipkart extends StatefulWidget {
  const Home_page_flipkart({Key? key}) : super(key: key);

  @override
  State<Home_page_flipkart> createState() => _Home_page_flipkartState();
}

class _Home_page_flipkartState extends State<Home_page_flipkart> {

  bool isflip=true;
  bool status = false;
  TextEditingController _searchController=TextEditingController();
  List image=['images/offer2.jpg','images/offer3.jpg','images/offer2.jpg','images/offer3.jpg','images/offer2.jpg'];
  final CarouselController carouselController=CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 3),
              child: Row(
                children:
                [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isflip = true ;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*.045,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: isflip ? Colors.blue[800] : Colors.grey[300],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/flipkart-icon.png',),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(width: 10,),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_page_flipkart()));
                              },
                              child: Text('Flipkart',
                              style: TextStyle(
                                  fontSize: 16.0 ,
                                  fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap:()
                      {
                        setState(() {
                        isflip = false ;
                        });

                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*.045,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: isflip ? Colors.grey[300] : Colors.green[800],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Image(image:
                                AssetImage('images/flipkart-icon.png'),
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(width: 10,),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage_Grocery()));
                                },
                                child: Text('Grocery',
                                  style: TextStyle(
                                    fontSize: 16.0 ,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Brand Mall',style: TextStyle(color: Colors.grey[700],fontSize: 12),),
                      SizedBox(height: 4,),
                      FlutterSwitch(
                        width: 55.0,
                        height: 20.0,
                        valueFontSize: 14.0,
                        activeTextFontWeight: FontWeight.w300,
                        inactiveTextFontWeight: FontWeight.w400,
                        value: status,
                        showOnOff: true,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey.shade300,
                        activeText: 'ON',
                        activeTextColor: Colors.white,
                        inactiveText: 'OFF',
                        inactiveTextColor: Colors.black,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.055,
                    width: MediaQuery.of(context).size.width*.7,
                    child: TextField(
                      cursorColor: Colors.grey,
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for products',
                        hintStyle: TextStyle(color: Colors.grey,),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.keyboard_voice_outlined,size: 28,),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.camera_alt_outlined,size: 28,),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search,size: 28,),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(height: 10,),
              InkWell(
                  onTap: (){
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: image.map(
                            (item) => Image.asset(
                          item,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 5,
                        ),
                    ).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 1.5,
                        viewportFraction: 1,
                        height: MediaQuery.of(context).size.height * .21,
                        onPageChanged: (index,reason){
                          setState(() {
                            currentIndex=index;
                          });
                        }
                    ),
                  ),
              ),
              Container(
                padding: EdgeInsets.only(right: 8,left: 8,top: 12),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.14,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Supercoin'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','NextGen\nBrands'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Money+'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','LiveShop+'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Game Zone'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','EMI'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Student Club'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Plus'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Group Buy'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Camera'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Fire Drops'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/super_coin.jpg.webp','Become a\nSeller'),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.16,
                padding: EdgeInsets.only(top: 4,bottom: 4,right: 8,left: 8),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.shade400,
                        Colors.pink.shade400,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer_offer('images/pic1.webp','Min. 50% off'),
                    buildContainer_offer('images/pic3.webp','Min. 60% off'),
                    buildContainer_offer('images/pic2.webp','Min. 30% off'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 16),
                child: Text('Recently Viewed Stores',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              ),
              Container(
                padding: EdgeInsets.only(right: 8,left: 8,top: 12),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildContainer_recentView('images/recent1.jpg','Plants Saplings'),
                    SizedBox(width: 8,),
                    buildContainer_recentView('images/recent2.jpg','Plant Seeds'),
                    SizedBox(width: 8,),
                    buildContainer_recentView('images/recent3.jpg','Cups & Saucers'),
                    SizedBox(width: 8,),
                    buildContainer_recentView('images/recent4.jpg','Wrist Watches'),
                    SizedBox(width: 8,),
                    buildContainer_recentView('images/recent5.jpg','Keybords'),
                    SizedBox(width: 8,),
                    buildContainer_recentView('images/recent6.jpg',"Women's Kurtas"),
                    SizedBox(width: 8,),
                    buildContainer_recentView('images/recent7 (2).jpg','Mobiles'),
                  ],
                ),
              ),
              SizedBox(height: 6,),
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 16),
                child: Text('Sponsored',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              ),
              Container(
                padding: EdgeInsets.only(right: 8,left: 8,top: 7),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                // decoration: BoxDecoration(
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(
                //           color: Colors.black54,
                //           blurRadius: 2.0,
                //           offset: Offset(0.0, 0.75),
                //         blurStyle: BlurStyle.normal
                //       )
                //     ],
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  buildContainer_sponse1('images/spon1.jpg','Stylish Sneakers','Min. 40% Off'),
                    buildContainer_sponse1('images/spon2.jpg','Classic Flip Flops','30-50% Off'),
                    buildContainer_sponse1('images/spon3.jpg','No. 1 Trimmer*','From 789/-'),
                  ],
                ),
              ),
              Divider(thickness: 1,),
              Container(
                padding: EdgeInsets.only(right: 8,left: 8,top: 2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                // decoration: BoxDecoration(
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(
                //           color: Colors.black54,
                //           blurRadius: 2.0,
                //           offset: Offset(0.0, 0.75),
                //         blurStyle: BlurStyle.normal
                //       )
                //     ],
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildContainer_sponse1('images/spon4.jpg','BT Calling | 1.6"HD','Spl. Price 2,499/-'),
                    buildContainer_sponse1('images/spon5.jpg','Best of Audio','Just 999/-'),
                    buildContainer_sponse1('images/spon6.jpg','BT Calling | 1.85"','1,299/-'),
                  ],
                ),
              )
            ]
          ),

        ),
      )
    );
  }

  Container buildContainer_sponse1(String image, String text,String subtext) {
    return Container(
                width: 112,
                height: 170,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        child: Image.asset(image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(text,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                      Text(subtext,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),textAlign: TextAlign.center,)
                    ]
                ),
              );
  }

  Container buildContainer_recentView(String image, String text) {
    return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2,right: 2,top: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(text,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),textAlign: TextAlign.center,)
                    ]
                  ),
                );
  }

  GestureDetector buildContainer_offer(String image, String text) {
    return GestureDetector(
      onTap: (){},
      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 115,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(image,)
                            )
                          ),
                        ),
                        Text(text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),)
                      ],
                    ),
                  ),
    );
  }

  Column buildCircleAvatar_icon(String image,String name) {
    return Column(
      children: [
        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.grey[300],
                          child: Image.asset(image,width: 30,height: 30,),
                        ),
        SizedBox(height: 10,),
        Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),textAlign: TextAlign.center,),
      ],
    );
  }
}

import 'package:flipkart_clone/home_flipkart.dart';
import 'package:flutter/material.dart';

class HomePage_Grocery extends StatefulWidget {
  const HomePage_Grocery({Key? key}) : super(key: key);

  @override
  State<HomePage_Grocery> createState() => _HomePage_GroceryState();
}

class _HomePage_GroceryState extends State<HomePage_Grocery> {

  bool isgroce=true;
  TextEditingController _searchController = TextEditingController();
  int indexCategory = 0 ;
  List image=['images/white sugar.png','images/aashirvaad.png'];
  List head=["Parry's White Label Sugar","AASHIRVAAD with 4-Step advantage\nlodized Salt"];
  List expiredate=['Expiry 5 Oct 2024','Expiry 24 Apr 2024'];
  List rate=['55','28'];
  var counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                            isgroce = false ;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.045,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: isgroce ? Colors.grey[300] : Colors.blue[800],
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
                                      color: Colors.black,
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
                                isgroce = true ;
                              });

                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.045,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: isgroce ? Colors.green[800] : Colors.grey[300],
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
                                        color: Colors.white
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
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height*.05,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search grocery products',
                      hintStyle: TextStyle(color: Colors.grey,),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.keyboard_voice_outlined,size: 30,),
                        onPressed: () {},
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search,size: 30,),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey.shade100)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              categeries(),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 6,top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_pin,size: 30,color: Colors.blue.shade700,),
                    Row(
                      children: [
                        Text('Delivery to ',style: TextStyle(fontWeight: FontWeight.w400),),
                        Text('676508, ',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('Malappuram',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text('    Change   '),
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              side: BorderSide(color: Colors.grey.shade400,style: BorderStyle.solid),

                            )
                        )
                      ),
                    ),
                  ],
                ),
              ),
              //Divider(color: Colors.grey.shade300,thickness: 1,),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  border: Border(top: BorderSide(color: Colors.grey.shade400))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Delivery by Jul 26 ',style: TextStyle(fontWeight: FontWeight.w600),),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.only(right: 8,left: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCircleAvatar_icon('images/flipkart-icon.png','All\nCategories'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Rice, Atta\n& Dal'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Oil &\nGhee'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Dry Fruits,\nNuts & Seeds'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Snacks &\nPackaged\nFood'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Chocolates &\nSweets'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Beverages'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Detergents &\nLaundry'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Body &\nSkin Care'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Oral\nCare'),
                    SizedBox(width: 8,),
                    buildCircleAvatar_icon('images/flipkart-icon.png','Home &\nKitchen'),
                  ],
                ),
              ),
              Image(
                  image: AssetImage('images/of2.png')
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 16,top: 7,bottom: 13),
                child: Text('Shop for 700/- to get Steal Deals',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,fontSize: 16),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey.shade300,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: head.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 13,bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(image[index],
                                    width: 80,
                                    height: 80,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 13,bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(head[index],style: TextStyle(fontSize: 15),),
                                  SizedBox(height: 5,),
                                  Text('1 kg',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,size: 12,color: Colors.green.shade800,),
                                      SizedBox(width: 5,),
                                      Text(expiredate[index],style: TextStyle(fontSize: 12,color: Colors.grey.shade600),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.currency_rupee,size: 15,weight: 4),
                                      Text('1',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                      SizedBox(width: 10,),
                                      Text(rate[index],style: TextStyle(fontSize: 14,decoration: TextDecoration.lineThrough,color: Colors.grey.shade600),),
                                      SizedBox(width: 100,),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: FloatingActionButton(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                          child: Icon(Icons.remove,color: Colors.white,),
                                          backgroundColor: Colors.blue.shade700,
                                          onPressed: () {
                                            setState(() {

                                            });
                                            counter--;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 14,),
                                      Text('$counter',style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      SizedBox(width: 14,),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: FloatingActionButton(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                          child: Icon(Icons.add,color: Colors.white,),
                                          backgroundColor: Colors.blue.shade700,
                                          onPressed: () {
                                            setState(() {

                                            });
                                            counter++;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 1,color: Colors.grey.shade300,)
                      ],
                    );
                  }
              ),
              Image(
                  image: AssetImage('images/of3.png')
              ),
              GestureDetector(
                onTap: (){},
                child: Image(
                    image: AssetImage('images/of1.png')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildCircleAvatar_icon(String image,String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Colors.amber.shade100,
              Colors.amber.shade300
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.transparent,
              child: Image.asset(image,width: 30,height: 30,)
          ),
        ),
        SizedBox(height: 8,),
        Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),textAlign: TextAlign.center,),
      ],
    );
  }

  SizedBox categeries() {
    List list=['Home','Categories','Top Offers','Monsoon Specials'];
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: list.length,
          scrollDirection: Axis.horizontal,

          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 12,right: 10),
              child: Text(
                  list[index],
                style: TextStyle(
                  //decoration: indexCategory == index ? TextDecoration.underline : TextDecoration.none,
                  //decorationThickness: 4,
                  fontSize: 14,
                  color: indexCategory == index ? Colors.green[700] : Colors.black,
                  fontWeight: FontWeight.w600,
                  decorationStyle: TextDecorationStyle.dashed
                ),
              ),
            );
          }
      ),
    );
  }
}

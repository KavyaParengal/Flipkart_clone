
import 'package:flipkart_clone/design/favorite_item.dart';
import 'package:flipkart_clone/design/home_flipkart.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15,top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hey! Kavya',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text('Explore',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade700
                  ),),
                  SizedBox(width: 3,),
                  Text('⭐Plus',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700
                  ),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios,size: 14,color: Colors.grey.shade600,)
                ],
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.18,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Icon(Icons.backpack_outlined,size: 28,color: Colors.blue.shade800),
                              SizedBox(width: 10,),
                              Text('Orders',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)
                            ],
                          ),
                          style: TextButton.styleFrom(fixedSize: Size(170, 44),side: BorderSide(color: Colors.grey.shade400,width: 1,)),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite_item()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.favorite_outline,size: 28,color: Colors.blue.shade800,),
                              SizedBox(width: 10,),
                              Text('Wishlist',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)
                            ],
                          ),
                          style: TextButton.styleFrom(fixedSize: Size(170, 44),side: BorderSide(color: Colors.grey.shade400,width: 1,)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Icon(Icons.card_giftcard,size: 28,color: Colors.blue.shade800),
                              SizedBox(width: 10,),
                              Text('Coupons',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)
                            ],
                          ),
                          style: TextButton.styleFrom(fixedSize: Size(170, 44),side: BorderSide(color: Colors.grey.shade400,width: 1,)),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Icon(Icons.headset_mic_outlined,size: 28,color: Colors.blue.shade800,),
                              SizedBox(width: 10,),
                              Text('Help Center',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),)
                            ],
                          ),
                          style: TextButton.styleFrom(fixedSize: Size(170, 44),side: BorderSide(color: Colors.grey.shade400,width: 1,)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_page_flipkart()));
              },
              child: Text('Log Out',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue.shade800),),
              style: TextButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width*.94, 42),
                  side: BorderSide(color: Colors.grey.shade400,width: 1,),
                  backgroundColor: Colors.white
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}

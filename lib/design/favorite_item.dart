
import 'package:flipkart_clone/design/add_to_cart.dart';
import 'package:flipkart_clone/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite_item extends StatefulWidget {
  const Favorite_item({Key? key}) : super(key: key);

  @override
  State<Favorite_item> createState() => _Favorite_itemState();
}

class _Favorite_itemState extends State<Favorite_item> {
  @override
  Widget build(BuildContext context) {

    final object= Provider.of<FavProvider_class>(context);
    List imageStore=object.favoriteImage;
    List nameStore=object.favoriteName;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Favorite List',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_to_Cart()));
              },
                icon: Icon(Icons.shopping_cart_outlined)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 20,top: 8),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: imageStore.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(imageStore[index])
                                      )
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: (){
                                        object.favorites(imageStore[index], nameStore[index]);
                                      },
                                      icon: object.icn_change(imageStore[index],nameStore[index]) ?
                                      Icon(Icons.favorite,color: Colors.red,) :
                                      Icon(Icons.favorite_outline,color: Colors.grey.shade500,),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(nameStore[index])
                              ],
                            ),
                            TextButton(
                              onPressed: (){
                                object.add_to_cart(imageStore[index], nameStore[index]);
                              },
                              child: Text('Add to Cart',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue.shade800),),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(MediaQuery.of(context).size.width*.36, 40),
                                  side: BorderSide(color: Colors.grey.shade400,width: 1,),
                                  backgroundColor: Colors.white
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(thickness: 1,color: Colors.grey.shade300,),
                        )
                      ],
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

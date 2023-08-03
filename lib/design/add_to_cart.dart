
import 'package:flipkart_clone/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_to_Cart extends StatefulWidget {
  const Add_to_Cart({Key? key}) : super(key: key);

  @override
  State<Add_to_Cart> createState() => _Add_to_CartState();
}

class _Add_to_CartState extends State<Add_to_Cart> {
  @override
  Widget build(BuildContext context) {

    final object= Provider.of<FavProvider_class>(context);
    List imageStore=object.cartImage;
    List nameStore=object.cartName;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Cart Items',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23
        ),),
        centerTitle: true,
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
                                ),
                                SizedBox(height: 5,),
                                Text(nameStore[index])
                              ],
                            ),
                            TextButton(
                              onPressed: (){
                                object.add_to_cart(imageStore[index], nameStore[index]);
                              },
                              child: Text('Remove from Cart',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue.shade800),),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(MediaQuery.of(context).size.width*.43, 40),
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

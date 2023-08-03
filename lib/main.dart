
import 'package:flipkart_clone/design/home_flipkart.dart';
import 'package:flipkart_clone/provider/fav_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      ChangeNotifierProvider(
        create: (context) => FavProvider_class(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home_page_flipkart(),
        ),
      )
  );
}
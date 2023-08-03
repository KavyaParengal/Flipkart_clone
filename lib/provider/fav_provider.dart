import 'package:flutter/cupertino.dart';

class FavProvider_class extends ChangeNotifier{
  List _recentImage=[];
  List _recentName=[];

  List _cartImage=[];
  List _cartName=[];

  List get favoriteImage=>_recentImage;
  List get favoriteName=>_recentName;

  List get cartImage=>_cartImage;
  List get cartName=>_cartName;

  void favorites(String recentImage,String name){
    final favitem=_recentImage.contains(recentImage);
    if(favitem){
      _recentImage.remove(recentImage);
      _recentName.remove(name);
    }
    else{
      _recentImage.add(recentImage);
      _recentName.add(name);
    }
    notifyListeners();
  }

  bool icn_change(String recentImage,String name){
    final favIcn=_recentImage.contains(recentImage);
    return favIcn;
  }

  void add_to_cart(String recentImage,String name){
    final c_image=_cartImage.contains(recentImage);
    if(c_image){
      _cartImage.remove(recentImage);
      _cartName.remove(name);
    }
    else{
      _cartImage.add(recentImage);
      _cartName.add(name);
    }
    notifyListeners();
  }

}
